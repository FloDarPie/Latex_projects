######################################################################
#
#         Copyright (c) 2023, gitlabci_gallery / latex
#         All rights reserved.
#
######################################################################


LATEXCMD=lualatex
PARENT_DIR=$(shell basename $(realpath .))

all: $(PARENT_DIR).pdf 

$(PARENT_DIR).pdf: main.tex
	TEXINPUTS=.:theme//:latex-inria-fonts//: \
	${LATEXCMD} -file-line-error -halt-on-error -jobname=$(PARENT_DIR) $<
	TEXINPUTS=.:theme//:latex-inria-fonts//: \
	${LATEXCMD} -file-line-error -halt-on-error -jobname=$(PARENT_DIR) $<

clean:
	@rm -f *.aux *.log *.nav *.out *.snm *.toc *.fls *.fdb_latexmk $(PARENT_DIR).pdf
