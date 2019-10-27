# DIY-LaTeX
Source code for "DIY LaTeX" in UCAS, China

Directories will be named as "#-NAME" where '#' is the number representing the lecture.

For guide on compiling, please **read the README file** in each directory. In general, (with '.latexmkrc' in that directory) you can simply type

    latexmk
to compile (and take coffee and have a rest), then

    latexmk -c
to remove the generated auxillary files, or

    latexmk -C
to remove all the generated files.
