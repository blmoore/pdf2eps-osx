# pdf2eps-osx
Want to automatically convert a few PDF files to EPS? Turns out there's various programs to try that each give a slightly different result... With that in mind here's a bash script that tries a few methods allowing you to find which works for your file (OS X specific). Current methods attempted:

1. Inkscape
  - [Command-line version](http://wiki.inkscape.org/wiki/index.php/MacOS_X#Inkscape_command_line) required
  - Good conversion, tight trimming

2. ImageMagick
  - Install with homebrew: `brew install imagemagick`
  - Nightmarish results

3. ghostscript
  - Install with homebrew: `brew install ghostscript`
  - Good conversion + respects PDF bounding

4. pdftops
  - Part of [xpdf](http://www.foolabs.com/xpdf/download.html)
  - Similar decent results to ghostscript

## Usage
```sh
pdf2eps example_file.pdf
```

Or, to convert all the PDF files in a directory

```sh
pdf2eps .
```

## Requirements

Other than those above, GNU tools should be installed (e.g. `grealpath`). Install these with homebrew:
```sh
brew install coreutils
```
