# PDF Optimizer

Uses pdfsizeopt to optimize a PDF and creates a JPG thumbnail 230 pixels wide from the first PDF page with mini_magick.

## Dependencies

- pdfsizeopt
    - Python: 2.x
    - Ghostscript
    - netpbm
    - jbig2enc
    - pngwolf-zopfli

- mini_magick
    - imagemagick: 6 or 7

## Install

    brew install python
    brew install ghostscript
    curl "https://raw.githubusercontent.com/pts/pdfsizeopt/master/pdfsizeopt.single" -o "vendor/pdfsizeopt.single"
    chmod +x vendor/pdfsizeopt.single

    brew install netpbm
    brew install jbig2enc
    brew tap vizjerai/extras
    brew install --HEAD pngwolf-zopfli

    brew install imagemagick

## Usage

    ./bin/pdf_optimizer <filename>.pdf

## Output

    ./output/<filename>.jpg
    ./output/<filename>.pdf