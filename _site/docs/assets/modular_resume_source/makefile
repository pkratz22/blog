#----------------------
# CONSTANTS
#----------------------
TEMPLATE=cv-template
PROJECT=Peter_Kratz_Resume
YAML=cv-data
TEX=pdflatex
BUILDTEX=$(TEX) $(PROJECT).tex

all:
	pandoc $(YAML).yml --template $(TEMPLATE).tex -o $(PROJECT).tex
	$(BUILDTEX)
	$(BUILDTEX)
	$(BUILDTEX)
	rm $(PROJECT).aux
	rm $(PROJECT).log
	rm $(PROJECT).out
	open $(PROJECT).pdf

clean-all:
	rm -f *.log *.aux *.out *.pdf

clean:
	rm -f *.log *.aux *.out
