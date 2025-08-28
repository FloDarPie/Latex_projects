LATEX=pdflatex
MAIN=notes
PRINT=impression

all: $(MAIN).pdf $(PRINT).pdf

$(MAIN).pdf: $(MAIN).tex
	$(LATEX) $<
	$(LATEX) $<

$(PRINT).pdf: $(PRINT).tex $(MAIN).pdf
	$(LATEX) $<
	$(LATEX) $<

clean:
	rm -f *.aux *.log *.out *.toc *.nav *.snm *.vrb

mrproper: clean
	rm -f $(MAIN).pdf $(PRINT).pdf
