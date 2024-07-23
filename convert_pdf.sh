#!/usr/bin/env bash
IN=~/Dokumente/ODT
OUT=~/Dokumente/PDF
for f in $IN/*.odt
do
  echo "Konvertiere $f nach pdf"
  filename=$(basename -- "$f")
  filename="${filename%.*}"
  ~/.unoserver/bin/unoconvert --convert-to pdf $f $OUT/$filename.pdf
done
