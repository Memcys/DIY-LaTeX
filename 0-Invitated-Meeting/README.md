##Compile
###With *latexmk*
This time we recommend using the tool **latexmk** with option -xelatex or -lualatex, i.e., given a .tex file (e.g., beamer.tex), running

    latexmk -xelatex beamer
or

    latexmk -lualatex beamer
will result in beamer.pdf.


###Without *latexmk*
For answers.tex and sheet.tex, you can also use only xelatex or lualatex. But for beamer.tex, you have to run xelatex/lualatex multiple times and in combination with biber.
