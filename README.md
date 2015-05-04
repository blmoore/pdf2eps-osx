# pdf2eps-osx
Want to automatically convert a few PDF files to EPS? Turns out there's various programs to try that each give a slightly different result... With that in mind here's a bash script that tries a few methods allowing you to find which works for your file (OS X specific). Current methods attempted:

1. Inkscape
  - [Command-line version](http://wiki.inkscape.org/wiki/index.php/MacOS_X#Inkscape_command_line) required
  - good conversion, egregious trimming

2. ImageMagick
  - Install with homebrew: `brew install imagemagick`
  - nightmarish results

3. ghostscript
  - Install with homebrew: `brew install ghostscript`
  - bravo, good conversion + respects PDF bounding

4. pdftops
  - Part of [xpdf](http://www.foolabs.com/xpdf/download.html)
  - similar results to ghostscript (decent)

## Usage
```sh
./pdf2eps example_file.pdf
```

## Requirements

GNU tools should be installed, e.g. `grealpath`. You can get these through homebrew:
```sh
brew install coreutils
```
