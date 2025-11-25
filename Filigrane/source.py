import sys
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QVBoxLayout, QWidget,
    QPushButton, QFileDialog, QLabel, QLineEdit, QComboBox
)
from PyQt6.QtCore import Qt
from PyPDF2 import PdfReader, PdfWriter
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.utils import ImageReader
import io

class WatermarkApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Appliquer un filigrane")
        self.setGeometry(100, 100, 500, 300)

        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)
        self.layout = QVBoxLayout(self.central_widget)

        self.pdf_path = ""
        self.watermark_text = ""
        self.watermark_image = ""

        self.init_ui()

    def init_ui(self):
        self.label = QLabel("Sélectionnez un PDF à filigraner :")
        self.layout.addWidget(self.label)

        self.select_button = QPushButton("Choisir un PDF")
        self.select_button.clicked.connect(self.select_pdf)
        self.layout.addWidget(self.select_button)

        self.watermark_type = QComboBox()
        self.watermark_type.addItems(["Texte", "Image"])
        self.layout.addWidget(self.watermark_type)

        self.watermark_text_input = QLineEdit()
        self.watermark_text_input.setPlaceholderText("Texte du filigrane")
        self.layout.addWidget(self.watermark_text_input)

        self.apply_button = QPushButton("Appliquer le filigrane")
        self.apply_button.clicked.connect(self.apply_watermark)
        self.layout.addWidget(self.apply_button)

    def select_pdf(self):
        file_dialog = QFileDialog()
        self.pdf_path, _ = file_dialog.getOpenFileName(self, "Ouvrir un PDF", "", "PDF Files (*.pdf)")
        if self.pdf_path:
            self.label.setText(f"PDF sélectionné : {self.pdf_path}")

    def apply_watermark(self):
        if not self.pdf_path:
            self.label.setText("Veuillez d'abord sélectionner un PDF.")
            return

        self.watermark_text = self.watermark_text_input.text()
        watermark_type = self.watermark_type.currentText()

        if watermark_type == "Texte" and not self.watermark_text:
            self.label.setText("Veuillez entrer un texte pour le filigrane.")
            return

        output_path = self.pdf_path.replace(".pdf", "_watermarked.pdf")
        self.add_watermark(self.pdf_path, output_path, watermark_type)
        self.label.setText(f"Filigrane appliqué. Résultat : {output_path}")

    def add_watermark(self, input_path, output_path, watermark_type):
        # Lire le PDF d'origine
        reader = PdfReader(input_path)
        writer = PdfWriter()

        # Créer un PDF de filigrane
        packet = io.BytesIO()
        c = canvas.Canvas(packet, pagesize=letter)

        if watermark_type == "Texte":
            c.setFont("Helvetica", 30)
            c.setFillColorRGB(0.5, 0.5, 0.5, alpha=0.3)
            c.rotate(45)
            c.drawString(100, 300, self.watermark_text)
        elif watermark_type == "Image":
            # À compléter : chargement et dessin de l'image
            pass

        c.save()
        packet.seek(0)
        watermark = PdfReader(packet)

        # Appliquer le filigrane à chaque page
        for page in reader.pages:
            page.merge_page(watermark.pages[0])
            writer.add_page(page)

        # Sauvegarder le résultat
        with open(output_path, "wb") as f:
            writer.write(f)

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = WatermarkApp()
    window.show()
    sys.exit(app.exec())
