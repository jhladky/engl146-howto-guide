SHELL := /bin/bash

all: guide

guide: guide.tex
	@pdflatex -interaction=nonstopmode guide.tex > .tmp || (cat .tmp; exit 1)
	@pdflatex -interaction=nonstopmode guide.tex > .tmp || (cat .tmp; exit 1)
	@scp guide.pdf host:~/Desktop/ > /dev/null
	@rm .tmp

clean:
	@rm -f guide.{aux,log,out,pdf,toc}
