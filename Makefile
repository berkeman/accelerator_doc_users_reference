DOC=doc

all:    ${DOC}.pdf

.figures:
	cd figures && make


${DOC}.pdf: doc.tex dataset.tex jobs.tex urd.tex iterator.tex standard_methods.tex xmtitle.tex introduction.tex tools.tex overview.tex setupinstall.tex misc.tex .figures
	git rev-parse HEAD | sed 's/^\(........\)..*/\1/' > gitrevision
	latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode -shell-escape" -use-make ${DOC}.tex

clean:
	latexmk -CA
	rm -f ${DOC}.pdf


show_missing_refs:
	cat doc.log | grep 'LaTeX Warning: Reference' | less
	#cat doc.log| grep -e Refere -e '(..*\.tex' | less

