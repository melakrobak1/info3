#!/bin/bash
set -e
#Zmniejszy wszystkie obrazki z katalogu “drop” i połączy je
# w animację za pomocą komendy convert *.jpg animacja.gif

rm -rf results
mkdir -p results
cd ../drop
for i in *.jpg
do
	cp $i ../s4/results/
done
cd ../s4/results
convert *.jpg -resize 50% animacja.gif


