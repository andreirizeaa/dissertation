# Latexmk configuration file for the dissertation project

# Use pdflatex for PDF output
$pdf_mode = 1;
$pdflatex = 'pdflatex -interaction=nonstopmode -synctex=1 %O %S';

# Use biber for bibliography (required for biblatex)
$biber = 'biber %O %S';
$bibtex_use = 2;

# Use makeglossaries for acronyms/glossary
$makeglossaries = 'makeglossaries %O %S';
push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';

# Custom dependency for glossaries
add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] );
    pushd $path;
    my $return = system "makeglossaries", $base_name;
    popd;
    return $return;
}

# Clean up auxiliary files
$clean_ext = 'acn acr alg aux bbl bcf blg fdb_latexmk fls glg glo gls ist lof log lot out run.xml synctex.gz toc';

# Output directory (optional - uncomment to use)
# $out_dir = 'build';

# Preview PDF after compilation (optional)
# $preview_mode = 1;
# $pdf_previewer = 'open -a Preview %O %S';  # macOS
