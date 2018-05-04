# PDF Optimizer

Uses pdfsizeopt to optimize a PDF and creates a thumbnail 230 pixels wide from the first PDF page.

## Install

    brew install python
    brew install ghostscript
    curl "https://raw.githubusercontent.com/pts/pdfsizeopt/master/pdfsizeopt.single" -o "vendor/pdfsizeopt.single"
    chmod +x vendor/pdfsizeopt.single

    brew install netpbm
    brew install jonof/kenutils/pngout
    brew install jbig2enc

    brew install imagemagick

## Usage

    ./bin/pdf_optimizer <filename>.pdf

## Output

    ./output/<filename>.jpg
    ./output/<filename>.pdf