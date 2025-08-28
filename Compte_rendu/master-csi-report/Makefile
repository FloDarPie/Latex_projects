.PHONY: all report


SRCTEX=$(wildcard *.tex)

RUBBER = rubber
RUBOPTS = --unsafe --command 'setlist arguments -shell-escape' --pdf



all: report

report: $(SRCTEX)
	$(RUBBER) $(RUBOPTS) report

clean:
	$(RUBBER) --pdf --clean report
	@rm -f *~ *.aux *.log *.bbl *.blg *.vrb \
	       *.toc *.nav *.out *.snm *.idx *.ilg *.ind\
		   *.dvi *fdb_latexmk *.fls *.rubbercache *.lol *.bcf *.xml
	@rm -rf _minted-*

distclean: clean
	@rm -fr $(MAIN).pdf

help:
	@echo "Makefile usage:\n\
  - make [all]\t\tbuild the report\n\
  - make clean\t\terase unuseful files\n\
  - make distclean\terase all produced files\n\
  - make help\t\tdisplay this help"

simple:
	$(RUBBER) $(RUBOPTS) simple;

simple-clean:
	$(RUBBER) --pdf --clean simple
