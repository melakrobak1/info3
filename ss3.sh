#!/bin/bash
set -e

#Na każde zdjęcie naniesie ramkę (argument -border 20x20) z aktualną datą (komenda date).


rm -rf results
mkdir -p results
cd ../drop
for i in *.jpg
do
	cp -r $i ../s3/results/
done

cd ../s3/results

for i in *.jpg
do
	data=$(date)
	convert $i -border 20x20 -pointsize 14 -draw "text 20, 20 '$data'" $i
done

#Na każde zdjęcie naniesie datę utworzenia tego zdjęcia
# (można ją wyciągnąć za pomocą komendy stat -c %y plik).

#for i in *.jpg
#do
#	utw=$(stat -c %y $i)
#	convert $i -border 30x30 -pointsize 14 -draw "text 20, 20 '$utw'" $i
#done

