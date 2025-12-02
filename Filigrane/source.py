import os
import subprocess
import helper
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QVBoxLayout, QHBoxLayout,
    QPushButton, QFileDialog, QLabel, QLineEdit, QSpinBox,
    QColorDialog, QMessageBox, QFrame, QGridLayout, QSizePolicy,
    QDoubleSpinBox, QSlider, QListWidget
)
from PyQt6.QtCore import Qt
from PyQt6.QtGui import QColor, QPainter, QFont, QPixmap

class LatexWatermarkApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Filigrane Imprimeur - LaTeX")
        
        # Taille de fenêtre souple
        largeur = 900
        hauteur= 400
        #self.setGeometry(100, 100, largeur, hauteur)
        # -- rigide
        self.setFixedSize(largeur, hauteur)

        # Paramètres par défaut
        self.pdf_path = ""
        self.watermark_text = "Travail en cours - version 1"
        #self.watermark_color = QColor(0, 0, 0, 256)  # Noir, DEBUG
        self.watermark_color = QColor(166, 166, 166, 100)  # Gris clair ,intensité
        self.watermark_font_size = 2 # en cm
        self.watermark_angle = 25
        self.watermark_lightness = 100

        helper.helper_loaded()
        # Interface
        self.init_ui()

    def init_ui(self):
        # Widget central et layout principal
        central_widget = QWidget()
        self.setCentralWidget(central_widget)
        main_layout = QHBoxLayout(central_widget)
        main_layout.setSpacing(10)

        # --- Colonne 1 : Sélection du PDF/Dossier ---
        col1 = QFrame()
        col1.setFrameShape(QFrame.Shape.Panel)
        col1_layout = QVBoxLayout(col1)

        # --- Sélection d'un PDF individuel ---
        self.label_pdf = QLabel("Sélectionnez un PDF à filigraner :")
        col1_layout.addWidget(self.label_pdf)

        self.select_button = QPushButton("Choisir un PDF")
        self.select_button.clicked.connect(self.select_pdf)
        col1_layout.addWidget(self.select_button)

        self.selected_pdf_label = QLabel("Aucun PDF sélectionné")
        col1_layout.addWidget(self.selected_pdf_label)

        # --- Séparation visuelle ---
        col1_layout.addWidget(QLabel("--- OU ---"), alignment=Qt.AlignmentFlag.AlignCenter)

        # --- Sélection d'un dossier ---
        self.label_folder = QLabel("Sélectionnez un dossier de PDFs :")
        col1_layout.addWidget(self.label_folder)

        self.select_folder_button = QPushButton("Choisir un dossier")
        self.select_folder_button.clicked.connect(self.select_folder)
        col1_layout.addWidget(self.select_folder_button)

        # Liste des fichiers PDF dans le dossier
        self.files_list = QListWidget()
        self.files_list.setSelectionMode(QListWidget.SelectionMode.ExtendedSelection)
        col1_layout.addWidget(self.files_list)

        col1_layout.addStretch()
        main_layout.addWidget(col1, stretch=1)

        # --- Colonne 2 : Paramétrage du filigrane ---
        col2 = QFrame()
        col2.setFrameShape(QFrame.Shape.Panel)
        col2_layout = QVBoxLayout(col2)

        # --- Texte du filigrane ---
        text_layout = QHBoxLayout()  # Layout horizontal pour le champ texte + bouton
        col2_layout.addWidget(QLabel("Texte du filigrane :"))

        # Champ de texte (QLineEdit)
        self.watermark_text_input = QLineEdit(self.watermark_text)
        self.watermark_text_input.setMinimumWidth(200)
        self.watermark_text_input.setSizePolicy(
            QSizePolicy.Policy.Expanding,
            QSizePolicy.Policy.Fixed
        )

        # Bouton "Valider"
        self.validate_text_button = QPushButton("Valider")
        self.validate_text_button.clicked.connect(self.validate_watermark_text)  # Lien vers une méthode

        # Ajout des widgets au layout horizontal
        text_layout.addWidget(self.watermark_text_input)
        text_layout.addSpacing(1)  # Espacement de 1 unité entre le champ et le bouton
        text_layout.addWidget(self.validate_text_button)

        # Ajout du layout horizontal à la colonne 2
        col2_layout.addLayout(text_layout)

        # --- Couleur du filigrane ---
        color_layout = QHBoxLayout()  # Layout horizontal pour le bouton + carré de couleur
        col2_layout.addWidget(QLabel("Couleur du filigrane :"))

        # Bouton pour choisir la couleur
        self.color_button = QPushButton("Choisir la couleur")
        self.color_button.clicked.connect(self.choose_color)

        # Carré de couleur (QLabel avec fond coloré)
        self.color_preview = QLabel()
        self.color_preview.setFixedSize(30, 30)  # Taille du carré
        self.color_preview.setStyleSheet(f"background-color: {self.watermark_color.name()}; border: 1px solid black;")

        # Ajout des widgets au layout horizontal
        color_layout.addWidget(self.color_button)
        color_layout.addWidget(self.color_preview)

        # Ajout du layout horizontal à la colonne 2
        col2_layout.addLayout(color_layout)

        # --- Taille de la police ---
        col2_layout.addWidget(QLabel("Taille de la police (cm) :"))
        self.font_size_spin = QDoubleSpinBox()
        self.font_size_spin.setRange(0.5, 100.0)
        self.font_size_spin.setValue(self.watermark_font_size)
        self.font_size_spin.setSingleStep(0.1)
        self.font_size_spin.valueChanged.connect(self.update_preview)
        col2_layout.addWidget(self.font_size_spin)

        # --- Angle de rotation ---
        col2_layout.addWidget(QLabel("Angle de rotation (°) :"))
        self.angle_spin = QSpinBox()
        self.angle_spin.setRange(0, 360)
        self.angle_spin.setValue(self.watermark_angle)
        self.angle_spin.valueChanged.connect(self.update_preview)
        col2_layout.addWidget(self.angle_spin)

        # --- Luminosité ---
        col2_layout.addWidget(QLabel("Luminosité (%) :"))
        self.lightness_slider = QSlider(Qt.Orientation.Horizontal)
        self.lightness_slider.setRange(0, 100)
        self.lightness_slider.setValue(self.watermark_lightness)
        self.lightness_slider.valueChanged.connect(self.update_lightness)
        col2_layout.addWidget(self.lightness_slider)


        col2_layout.addStretch()
        main_layout.addWidget(col2, stretch=1)

        # --- Colonne 3 : Aperçu et application du filigrane ---
        col3 = QFrame()
        col3.setFrameShape(QFrame.Shape.Panel)
        col3_layout = QVBoxLayout(col3)

        col3_layout.addWidget(QLabel("Aperçu du filigrane :"))
        self.preview_width = 200
        self.preview_height = int(self.preview_width * 1.414)  # Rapport format A4
        self.preview_label = QLabel()
        self.preview_label.setFixedSize(self.preview_width, self.preview_height)
        self.preview_label.setStyleSheet("background-color: white; border: 1px solid black;")
        self.preview_label.setAlignment(Qt.AlignmentFlag.AlignCenter)
        col3_layout.addWidget(self.preview_label, alignment=Qt.AlignmentFlag.AlignCenter)
        # col3_layout.addSpacing(20)
        col3_layout.addStretch()
        self.apply_button = QPushButton("            Appliquer le filigrane            ")
        self.apply_button.setEnabled(False) # Désactivé par défaut - attente de pdf
        self.apply_button.clicked.connect(self.apply_watermark)
        col3_layout.addWidget(self.apply_button, alignment=Qt.AlignmentFlag.AlignCenter)

        col3_layout.addStretch()
        main_layout.addWidget(col3, stretch=1)
        
        # Mise à jour de l'aperçu
        self.update_preview()

    def select_pdf(self):
        file_dialog = QFileDialog()
        self.pdf_path, _ = file_dialog.getOpenFileName(self, "Ouvrir un PDF", "", "PDF Files (*.pdf)")
        if self.pdf_path:
            self.files_list.clear() # Désactive les pdfs de la partie équipe
            self.selected_pdf_label.setText(os.path.basename(self.pdf_path))
            self.apply_button.setEnabled(True)  # Active le boutton pour la compilation

    def select_folder(self):
        """Ouvre une boîte de dialogue pour sélectionner un dossier."""
        folder_path = QFileDialog.getExistingDirectory(self, "Sélectionner un dossier de PDFs")
        if folder_path:
            self.files_list.clear()

            self.selected_pdf_label.setText("Aucun PDF sélectionné") # Désactive le pdf de la partie solo
            self.pdf_path = ""
            # Lister les fichiers PDF dans le dossier
            for file in os.listdir(folder_path):
                if file.lower().endswith('.pdf'):
                    self.files_list.addItem(file)
            self.current_folder = folder_path
            # Active le boutton pour la compilation
            if self.files_list.count() > 0:
                self.apply_button.setEnabled(True) 

    def validate_watermark_text(self):
        """Met à jour le texte du filigrane et l'aperçu."""
        self.watermark_text = self.watermark_text_input.text()
        self.update_preview()

    def choose_color(self):
        color = QColorDialog.getColor(self.watermark_color, self, "Choisir la couleur du filigrane")
        if color.isValid():
            self.watermark_color = color
            self.color_preview.setStyleSheet(f"background-color: {color.name()}; border: 1px solid black;")
            self.update_preview()

    def update_lightness(self, value):
        self.watermark_lightness = value
        # Mettre à jour la couleur avec la nouvelle luminosité
        self.watermark_color.setAlpha(int(255 * (value) / 100))
        self.color_preview.setStyleSheet(f"background-color: {self.watermark_color.name()}; border: 1px solid black;")
        self.update_preview()

    def update_preview(self):
        self.watermark_text = self.watermark_text_input.text()
        self.watermark_font_size = self.font_size_spin.value()
        self.watermark_angle = self.angle_spin.value()

        # Crée un pixmap valide
        pixmap = QPixmap(self.preview_label.width(), self.preview_label.height())
        pixmap.fill(Qt.GlobalColor.white)

        painter = QPainter(pixmap)
        try:
            font_size_px = helper.preview_convertor(self.preview_width, self.watermark_font_size)
            painter.setFont(QFont("Arial", font_size_px))
            painter.setPen(self.watermark_color)

            # Centre la rotation
            painter.translate(pixmap.width() / 2, pixmap.height() / 2)
            painter.rotate(360- self.watermark_angle)
            font_metrics = painter.fontMetrics()
            text_width = font_metrics.horizontalAdvance(self.watermark_text)
            text_height = font_metrics.height()

            # Centre le texte en tenant compte de sa taille
            painter.translate(pixmap.width() / 2 - text_width,
                            text_height / 2)
            painter.drawText(0, 0, self.watermark_text)  # Dessine le texte centré
        finally:
            painter.end()

        self.preview_label.setPixmap(pixmap)

    def apply_watermark(self):
        """Applique le filigrane au PDF sélectionné ou aux PDFs du dossier."""
        if hasattr(self, 'current_folder') and self.files_list.count() > 0:
            # Mode dossier : appliquer à tous les PDFs sélectionnés
            selected_files = [self.files_list.takeItem(0).text() for _ in range(self.files_list.count())]
            for i in selected_files:
                self.files_list.addItem(i)
            files_to_mark = [os.path.join(self.current_folder, item) for item in selected_files]
            if not files_to_mark:
                QMessageBox.warning(self, "Aucun fichier sélectionné", "Veuillez sélectionner au moins un PDF.")
                return

            """ Mode multi fichiers"""
            for pdf_path in files_to_mark:
                tex_content = self.generate_tex_file(pdf_path)
                tex_path = "watermark_temp.tex"
                with open(tex_path, "w", encoding="utf-8") as f:
                    f.write(tex_content)
                output_pdf = pdf_path.replace(".pdf", "_watermarked.pdf")
                for i in range(2):
                    try:
                        subprocess.run(["pdflatex", "-shell-escape", tex_path], check=True)
                        if os.path.exists("watermark_temp.pdf"):
                            os.rename("watermark_temp.pdf", output_pdf)
                        else:
                            QMessageBox.critical(self, "Erreur", "Le fichier PDF résultant n'a pas été généré.")
                    except subprocess.CalledProcessError as e:
                        QMessageBox.critical(self, "Erreur", f"La compilation LaTeX a échoué : {e}")
                    except Exception as e:
                        QMessageBox.critical(self, "Erreur", f"Une erreur est survenue : {e}")
        
        else : # self.pdf_path:
            # Mode fichier unique
            tex_content = self.generate_tex_file(self.pdf_path)
            tex_path = "watermark_temp.tex"
            with open(tex_path, "w", encoding="utf-8") as f:
                f.write(tex_content)

            # Compiler avec pdflatex
            output_pdf = self.pdf_path.replace(".pdf", "_watermarked.pdf")
            for i in range(2):
                try:
                    subprocess.run(["pdflatex", "-shell-escape", tex_path], check=True)
                    if os.path.exists("watermark_temp.pdf"):
                        os.rename("watermark_temp.pdf", output_pdf)
                    else:
                        QMessageBox.critical(self, "Erreur", "Le fichier PDF résultant n'a pas été généré.")
                except subprocess.CalledProcessError as e:
                    QMessageBox.critical(self, "Erreur", f"La compilation LaTeX a échoué : {e}")
                except Exception as e:
                    QMessageBox.critical(self, "Erreur", f"Une erreur est survenue : {e}")

        QMessageBox.information(self, "Succès", f"Filigrane appliqué. Résultat : {output_pdf}")
        helper.cleaner()

    def generate_tex_file(self, pdf_path):
        # Convertir QColor en format LateX, valeur au format héxadécimal
        color = self.watermark_color.name()[1:]
        return f"""\\documentclass{{article}}
\\usepackage{{draftwatermark}}
\\usepackage{{pdfpages}}
\\usepackage{{anyfontsize}}
\\usepackage{{xcolor}}
\\definecolor{{watermarkcolor}}{{HTML}}{{{color}}}

\\SetWatermarkText{{{self.watermark_text}}}
\\SetWatermarkColor{{watermarkcolor!{self.watermark_lightness}}}
\\SetWatermarkFontSize{{{int(self.watermark_font_size)}cm}}
\\SetWatermarkAngle{{{self.watermark_angle}}}
\\begin{{document}}
\\includepdf[pages=-]{{{pdf_path}}}
\\end{{document}}
"""

if __name__ == "__main__":
    app = QApplication([])
    window = LatexWatermarkApp()
    window.show()
    app.exec()
