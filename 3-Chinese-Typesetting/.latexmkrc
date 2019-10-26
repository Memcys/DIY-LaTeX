# Default engine to xelatex
$latex = "xelatex -synctex=1 -file-line-error";

# For xelatex. Following https://blog.prosight.me/2019/05/23/latexmk/
$pdf_mode = 5;

# Default files
@default_files = ('Demos/demo-chapter-4', 'Demos/demo-chapter-34', 'Chinese', 'Chinese-beamer');

# Additional auxillary files to clean up
$clean_ext = "listing vrb nav exercise run.xml snm lol xdv";

# Automatically clean up .bib or .bbl
$bibtex_use = 1.5;

# Show CPU time used
$show_time = 1;
