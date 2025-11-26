import os
import glob

def helper_loaded():
    print("Loader correctly loaded - helper functionnal")


def cleaner():
    """Supprime tous les fichiers temporaires 'watermark_temp.*'."""
    temp_files = glob.glob("watermark_temp.*")  # Trouve tous les fichiers commençant par "watermark_temp."
    for file in temp_files:
        try:
            os.remove(file)
        except OSError as e:
            print(f"Erreur lors de la suppression de {file}: {e}")

def preview_convertor(ref, value_cm):
    """ Convertit l'entrée en cm en pixels pour l'apperçu """

    # ref - taille de l'écran de preview
    # value_px - valeur à convertir en pixels

    A4_largeur = 21 #convertit en pixels
    return int(value_cm * ref / A4_largeur * 0.681)