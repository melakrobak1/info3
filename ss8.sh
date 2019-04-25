#!/bin/bash
set -e
#Rozłoży animację GIF na pojedyncze obrazy JPG. Do każdego z otrzymanych obrazów dopisze tekst
rm -rf results
mkdir -p results
cp animacja.gif results/animacja.gif
cd results

convert -strip animacja.gif test.jpg
#add leading zeros to .jpg-s
for i in {0..9}
do
	mv test-$i.jpg test-00$i.jpg
done
for i in {10..99}
do
        mv test-$i.jpg test-0$i.jpg
done

k=0
for i in *.jpg
do
	convert $i -draw "text 20, 20 "Frame_$k"" $i
	k=$((k+1))
done
convert *.jpg animacja2.gif
rm -f *.jpg


