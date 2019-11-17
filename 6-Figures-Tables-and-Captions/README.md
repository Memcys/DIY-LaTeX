## Report on Figures, Tables and Captions

### Documents
The main .tex files are *figures-and-tables.tex* and *figures-and-tables-beamer.tex*, the former being prepared for documentation (article) and the latter slides (beamer).

*.sty are LaTeX style files. Files in Demos/ are standalone demo codes. Non-standalone codes, inputed in figures-and-tables.tex, are in Sections/.

### Compilation
#### Manual compilation
To do seperate compilation, first you have to compile the all the files in Demos/, and compile 'Demos/demo-tikz.tex' before 'Demos/demo-boxed.tex'.
Then you can feel free to compile the main .tex files: *figures-and-tables.tex* and *figures-and-tables-beamer.tex*.

#### Automatic one-time compilation
By virtue of the .latexmkrc file, you can simply type

    latexmk
and then take coffee and have a rest; it took 57.44 seconds for the first compilation in my Linux machine.

#### Clean up
To keep .pdf files, please type

    latexmk -c
while

    latexmk -C
removes all the generated files.
