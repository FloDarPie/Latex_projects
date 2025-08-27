MAIN=main
SLIDES=slides
HANDOUT=handout
HANDOUT_NOTES=handout-notes

SRCTEX=$(wildcard *.tex)

RUBBER = rubber
RUBOPTS = --unsafe --command 'setlist arguments -shell-escape' --pdf

all: $(SLIDES).pdf

full:  $(SLIDES).pdf $(HANDOUT).pdf $(HANDOUT_NOTES).pdf

$(SLIDES).pdf: $(SRCTEX)
	$(RUBBER) $(RUBOPTS) $(SLIDES);

$(HANDOUT).pdf: $(SRCTEX)
	$(RUBBER) $(RUBOPTS) $(HANDOUT);

$(HANDOUT_NOTES).pdf: $(SRCTEX)
	$(RUBBER) $(RUBOPTS) $(HANDOUT_NOTES);

clean:
	$(RUBBER) --pdf --clean $(SLIDES)
	$(RUBBER) --pdf --clean $(HANDOUT)
	$(RUBBER) --pdf --clean $(HANDOUT_NOTES)
	@rm -f *~ *.aux *.log *.bbl *.blg *.vrb *.toc *.nav *.out *.snm
	@rm -rf _minted-*/

help:
	@echo "Makefile usage:\n\
  - make [all]\t\tbuild the slides\n\
  - make full\t\tbuild the slides and the handouts\n\
  - make clean\t\terase unuseful files\n\
  - make help\t\tdisplay this help"
