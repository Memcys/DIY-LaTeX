## Report on Commonly-used Chinese in LaTeX
### Compilation
#### Seperate compilation
To do seperate compilation, first you have to compile the two .tex files in Demos/: *demo-chapter-4.tex* and *demo-chapter-34.tex* to generate .pdf files included in *Chinese.tex*.

    cd Demos
    latexmk -xelatex demo-chapter-4
    latexmk -xelatex demo-chapter-34
Then you can feel free to compile the main .tex files: *Chinese.tex* and *Chinese-beamer.tex*.

    cd ../
    latexmk -xelatex Chinese
    latexmk -xelatex Chinese-beamer

#### Automatic one-time compilation
By virtue of the .latexmkrc file, you can simply type

    latexmk
and then take coffee and have a rest; it took 31.13 seconds for the first compilation in my Linux machine.

#### Clean up
To keep .pdf files, please type

    latexmk -c
while

    latexmk -C
removes all the generated files.

### Documents
The main .tex files are *Chinese.tex* and *Chinese-beamer.tex*, the former being prepared for documentation (article) and the latter slides (beamer).

*.sty are LaTeX style files. Files in Demos are standalone demo codes. Non-standalone codes, inputed in Chinese.tex, are in Sections.
