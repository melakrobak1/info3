#!/bin/bash
set -e
#Zmniejszy wszystkie pliki .jpg zawarte w tym samym katalogu,
# w którym znajduje się skrypt i umieści je w innym katalogu.

for i in  *.jpg
do
	convert $i -resize 50% a_$i
	mv $i ../results/$i
done


