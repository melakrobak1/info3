#!/bin/bash
set -e

#Dokona konwersji wszystkich plików .jpg na .gif,
# dodając końcówkę (plik.jpg -> plik.jpg.gif). lub na ->.gif
rm -rf ../results ../results2
mkdir -p ../results ../results2



for i in *.jpg
do
	cp -r $i ../results/
	cp -r $i ../results2/
done

cd ../results

for i in *.jpg
do
	convert $i $i.gif
	rm -rf $i
done

cd ../results2

for i in *.jpg
do
	j=$(echo $i | sed 's/jpg$/gif/')
	convert $i $j
	rm -rf $i
done
