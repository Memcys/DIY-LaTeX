##Compile
###With *latexmk*
We recommend using the tool **latexmk**
#### The recommended way
without any options, (by virtue of '.latexmkrc',) simply type

    latexmk
#### Custom way
With option -xelatex or -lualatex, i.e., given a .tex file (e.g., beamer.tex), running

    latexmk -xelatex beamer
or

    latexmk -lualatex beamer
will result in beamer.pdf.


###Without *latexmk*
For answers.tex and sheet.tex, you can also use only xelatex or lualatex. But for beamer.tex, you have to run xelatex/lualatex multiple times and in combination with biber.
