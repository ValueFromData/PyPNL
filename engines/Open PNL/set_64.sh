#!/bin/bash

BASEDIR=$(dirname $0)

ext=.tmp
for fileName in $(find $BASEDIR -name Makefile)
do
  sed  's/DEFS\ =\ /DEFS\ =\ \-fPIC\ /g' $fileName &>"$fileName$ext"
  rm -f $fileName
  mv -f "$fileName$ext" $fileName
done

fileName=$BASEDIR/Makefile
sed  's/DEFS\ =\ /DEFS\ =\ \-DBIT_64\ /g' $fileName &>"$fileName$ext"
rm -f $fileName
mv -f "$fileName$ext" $fileName


fileName=$BASEDIR/c_pgmtk/src/Makefile
sed  's/DEFS\ =\ /DEFS\ =\ \-DBIT_64\ /g' $fileName &>"$fileName$ext"
rm -f $fileName
mv -f "$fileName$ext" $fileName
