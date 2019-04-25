#!/bin/bash
set -e
#Doda do obrazka ramkę i wypisze na niej wybraną informację EXIF. 
rm -rf results
mkdir -p results
cd ../japan

for i in *.jpg
do
	cp -r $i  ../s5/results/
done
cd ../s5/results
for i in *.jpg
do
	info=$(identify -format "%[EXIF:Make]" $i )
	convert $i -pointsize 12 -border 30x30 -draw "text 15,15 '$info' " $i
done
