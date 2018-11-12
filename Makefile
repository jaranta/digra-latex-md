# Change these if needed: first is the source file, others are templates used
SOURCE = $(filter-out README.md, $(wildcard *.md)) # try to convert any .md files in the folder, except README.md
PDFTEMPLATE = digra.latex # the default latex template

# Just the file name, no extension
SOURCEBASENAME = $(basename $(SOURCE))

# Assume that images are in folder 'img' and either .jpg or .png files
IMG = $(wildcard *.jpg *.png)
IMGFOLDER = $(addprefix img/, $(IMG))

pdf:	$(SOURCE) $(IMGFOLDER)
	pandoc \
	--normalize \
	--template=$(PDFTEMPLATE) \
	--latex-engine=xelatex \
	--filter pandoc-citeproc \
	$< -o $(SOURCEBASENAME).pdf

all:	pdf
