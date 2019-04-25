#!/bin/bash
set -e
#Połączy wszystkie obrazki w danym katalogu, zmniejszone do rozmiaru 10 na 10 pikseli,
# w jeden duży obraz JPG
rm -rf results
mkdir -p results
cd ../drop
for i in *.jpg
do
	cp $i ../s7/results/
done
cd ../s7/results

for i in *.jpg
do
	convert $i -resize 10x10\! $i
done

for j in  {0..9}
do
	convert drop-0$j*.jpg  +append poziom_$j.jpg
	convert drop-1$j*.jpg +append poziom1_$j.jpg
done

convert poziom*.jpg -append full.jpg

