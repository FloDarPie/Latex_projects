MAIN=report

SRCTEX=$(wildcard *.tex)

RUBBER = rubber
RUBOPTS = --unsafe --command 'setlist arguments -shell-escape' --pdf

all: $(MAIN).pdf

$(MAIN).pdf: $(SRCTEX)
	$(RUBBER) $(RUBOPTS) $(MAIN);

clean:
	$(RUBBER) --pdf --clean $(MAIN)
	@rm -f *~ *.aux *.log *.bbl *.blg *.vrb \
	       *.toc *.nav *.out *.snm *.idx *.ilg *.ind
	@rm -rf _minted-*

distclean: clean
	@rm -fr $(MAIN).pdf

help:
	@echo "Makefile usage:\n\
  - make [all]\t\tbuild the report\n\
  - make clean\t\terase unuseful files\n\
  - make distclean\terase all produced files\n\
  - make help\t\tdisplay this help"
