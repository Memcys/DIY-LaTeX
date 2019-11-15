# Default engine to xelatex
$latex = "xelatex -synctex=1 -file-line-error %0 %S";

# For xelatex. Following https://blog.prosight.me/2019/05/23/latexmk/
$pdf_mode = 5;

# Default files
@default_files = ('Demos/demo-tikz', 'Demos/demo-caption', 'Demos/demo-continuedfloat', 'Demos/demo-pdflscape', 'Demos/demo-sidecap', 'Demos/demo-subcaption', 'Demos/demo-boxed', 'figures-and-tables', 'figures-and-tables-beamer');

# Put all generated files (including auxillary files) to the given directory
# $out_dir = "Out";

# Additional auxillary files to clean up
$clean_ext = "listing vrb nav exercise run.xml snm lol xdv";

# Automatically clean up .bib or .bbl
$bibtex_use = 1.5;

# Show CPU time used
$show_time = 1;
