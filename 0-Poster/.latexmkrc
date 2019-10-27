# Default engine to xelatex
$latex = "xelatex -synctex=1 -file-line-error";

# For xelatex. Following https://blog.prosight.me/2019/05/23/latexmk/
$pdf_mode = 5;

# Default files
@default_files = ('circular_glow', 'poster_snow', 'invitation');

# Put all generated files (including auxillary files) to the given directory
# $out_dir = "Out";

# Additional auxillary files to clean up
$clean_ext = "xdv";

# Automatically clean up .bib or .bbl
$bibtex_use = 1.5;

# Show CPU time used
$show_time = 1;
