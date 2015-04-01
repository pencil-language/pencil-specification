NAME=RR-8706

all:
	pdflatex \\nonstopmode \\input $(NAME)
	pdflatex \\nonstopmode \\input $(NAME)
	bibtex $(NAME)
	pdflatex \\nonstopmode \\input $(NAME)
	pdflatex \\nonstopmode \\input $(NAME)

clean:
	-rm -f `find \( -iname "*.bbl" -or -iname "*.blg" -or -iname "*.aux" -or -iname "*.toc" -or -iname "*~" -or -iname "*.log" -or -iname "*.out" \)`
	-rm -f $(NAME).pdf carptitle-eps-converted-to.pdf carplogo-eps-converted-to.pdf
	-rm -f .compareRevisions*
