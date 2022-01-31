all: svg

svg: monadUnit.svg monadAssociativity.svg tmapstar.svg tmapid.svg terminalTwoCat.svg laxEta.svg laxMu.svg

.SUFFIXES: .tex .svg

.tex.svg: defs.tex
	pdflatex -shell-escape -interaction=nonstopmode $<

clean:
	rm *.pdf || true
	rm *.svg || true
	rm *.log || true
	rm *.aux || true
	rm *~ || true
