This is a Pandoc-compatible LaTeX style file for the DiGRA conference. You need Pandoc and some LaTeX installation in order to make the templates work.

This uses fontspec for the Arial font, which means you can't use pdflatex as your tex compiler.

# Usage

You must start with a YAML-section, e.g.

	 ---
	 title: "Article Title"
	 author:
	 - name: First Author
	   affiliation: Institutional Affiliation
	 bibliography: bibliography.bib
	 conference: "1^st^ International Joint Conference of DiGRA and FDG"
	 ---

And end the document with

	\theendnotes

	# Bibliography

See `digra.md` for an example. 

Note that the bibliography uses the complete Chicago format instead of the simpler DiGRA format, because there is no CSL for the DiGRA format.

Figure 1 is also missing, because it was not part of the LaTeX template.

Convert with

	pandoc --latex-engine=xelatex --smart --no-tex-ligatures --filter pandoc-citeproc --template=digra.latex digra.md -o digra.pdf
