## Acknowledgement
These poster*.tex use as the TeX class file the *modified* **betterposter.cls** from https://github.com/rafaelbailo/betterposter-latex-template.git.

## Compile
Please use **xelatex** or **lualatex**.

### Recommended way

    latexmk

### Custom way
First, compile invitation.tex (and also circular_glow.tex for poster_snow.tex):

    xelatex invitation
    xelatex circular_glow	# Do this for poster_snow.tex
to get the invitation.pdf (and also circular_glow.pdf) file(s), which is(/are) included in the poster*.tex files.

Then, compile poster*.tex (e.g., poster_snow.tex):

    xelatex poster_snow

The output file will be named poster*.pdf (in this example, poster_snow.pdf). The default paper size is A0.
