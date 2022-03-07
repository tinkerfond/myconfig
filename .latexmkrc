$pdflatex = 'pdflatex %O %S';
# Files to be cleaned by latexmk -c 
push @generated_exts, "synctex.gz";
push @generated_exts, "dvi";
