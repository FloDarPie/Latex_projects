.PHONY: submakefile fast biblio pdf all latexmk

# Chemin du projet
p ?= .

# Règle additionnelle
r ?= 

# Variables
TEX_DIR = $(p)
TEX_FILE = $(wildcard $(TEX_DIR)*.tex)
BIB_FILE = $(wildcard $(TEX_DIR)*.bib)
SUB_MAKEFILE = $(wildcard $(TEX_DIR)Makefile)

# Vérification de l'existence du fichier .bib
ifneq ($(BIB_FILE),)
  BIB_FILE := $(BIB_FILE)
#else
#  $(error Aucun fichier .bib trouvé dans le répertoire $(TEX_DIR))
endif

#vérification d'un makefile dans la source
ifneq ($(SUB_MAKEFILE),)
	SUB_MAKEFILE := $(SUB_MAKEFILE)
#else
#	$(error Aucun makefile trouvé dans $(TEX_DIR) - $(SUB_MAKEFILE))
endif

all: fast clean

latexmk:
	latexmk -pdf -outdir=$(TEX_DIR) $(TEX_FILE)

biber:
	cd $(TEX_DIR) && \
	pdflatex $(notdir $(TEX_FILE)) && \
	biber  $(basename $(notdir $(TEX_FILE))) && \
	pdflatex $(notdir $(TEX_FILE)) && \
	pdflatex $(notdir $(TEX_FILE))

biblatex:
	cd $(TEX_DIR) && \
	pdflatex $(notdir $(TEX_FILE)) && \
	biblatex  $(basename $(notdir $(TEX_FILE))) && \
	pdflatex $(notdir $(TEX_FILE)) && \
	pdflatex $(notdir $(TEX_FILE))

fast:
	cd $(TEX_DIR) && \
	pdflatex $(notdir $(TEX_FILE)) && \
	pdflatex $(notdir $(TEX_FILE))

clean:
	rm -f $(TEX_DIR)*.aux $(TEX_DIR)*.log $(TEX_DIR)*.out $(TEX_DIR)*.toc $(TEX_DIR)*.bbl \
	$(TEX_DIR)*.blg $(TEX_DIR)*.synctex.gz $(TEX_DIR)*.vrb $(TEX_DIR)*.snm $(TEX_DIR)*.fls \
	$(TEX_DIR)*.nav $(TEX_DIR)*.bcf $(TEX_DIR)*.fdb_latexmk $(TEX_DIR)*.xml

clean_pdf:
	rm -f $(TEX_DIR)*.pdf

clean_all: clean clean_pdf

pdf: latexmk

submakefile:
	cd $(TEX_DIR) && $(MAKE) -f $(notdir $(SUB_MAKEFILE)) $(r)
