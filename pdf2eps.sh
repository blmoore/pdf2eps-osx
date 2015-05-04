
# choose which to progs to try:
inkscape=true
gs=true
imagemagick=true
gs=true
pdftops=true

# TODO: allow $1 to be file/directory
#       - either convert (single file) or iterate through dir

dir="pdf"

for i in `ls $dir/*.pdf`; do
  b="${i%%.*}"
  echo "\nConverting: $b (Absolute path: `grealpath $i`)"

  ###  Inkscape
  #
  # OS X install :: http://wiki.inkscape.org/wiki/index.php/MacOS_X#Inkscape_command_line
  #        Notes :: good conversion, egregious trimming

  if [ $inkscape = true ]; then
    mkdir -p inkscape
    inkscape `grealpath $dir/$i` --export-eps=`grealpath inkscape`/$b.eps
    if [ $? -ne 0 ]; then echo "Inkscape failed" && inkscape=false; fi
  fi


  ###  ImageMagick
  #
  # OS X install :: brew install imagemagick
  #        Notes :: nightmarish results

  if [ $imagemagick = true ]; then
    mkdir -p imagemagick
    convert $dir/$i imagemagick/$b.eps
    if [ $? -ne 0 ]; then echo "ImageMagick failed" && imagemagick=false; fi
  fi


  ###  ghostscript
  #
  # OS X install :: brew install ghostscript
  #        Notes :: bravo, good conversion + respects PDF bounding

  if [ $gs = true ]; then
    mkdir -p ghostscript
    gs -q -dNOCACHE -dNOPAUSE -dBATCH -dSAFER -sDEVICE=eps2write -sOutputFile=ghostscript/$b.eps $dir/$i
    if [ $? -ne 0 ]; then echo "Ghostscript failed" && gs=false; fi
  fi

  ###  pdftops
  #
  # OS X install :: part of xpdf (binaries at: http://www.foolabs.com/xpdf/download.html)
  #        Notes :: similar results to ghostscript

  if [ $pdftops = true ]; then
    mkdir -p pdftops
    pdftops -eps $dir/$i
    mv $dir/$b.eps pdftops/. 2>/dev/null
    if [ $? -ne 0 ]; then echo "pdftops failed" && pdftops=false; fi
  fi

done
