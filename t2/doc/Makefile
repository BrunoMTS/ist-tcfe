# ---------------------------------------------------------
# type the "make" command to create report.pdf 
# ---------------------------------------------------------

#doc name
FILE=report

#list of LibreOffice Draw files
LODFIGS = $(patsubst %.odg,%.pdf,$(wildcard *.odg))

all: $(FILE).pdf
	evince $< &

$(FILE).pdf: $(wildcard *.tex) $(LODFIGS)
	cp -f ../mat/*.tex .
	cp -f ../mat/*.eps .
	cp -f ../sim1/*.tex .
	cp -f ../sim2/*.tex .
	cp -f ../sim3/*.pdf .
	cp -f ../sim4/*.pdf .
	cp -f ../sim5/*.pdf .
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex


#convert libreoffice draw figures to pdf
%.pdf: %.odg 
	soffice --headless --convert-to pdf $<

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps
	@rm -rf values1_tab.tex
	@rm -rf values2_tab.tex
	@rm -rf octavevalues1_tab.tex
	@rm -rf octavevalues2_tab.tex
	@rm -rf octavevalues3_tab.tex
.PHONY: all clean


