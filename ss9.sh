#!/bin/bash
set -e
rm -f  results8/*.jpg results8/*.sh
cp japan/*.jpg results8
cd results8

#scriptception
cat >tmp.sh <<EOF
EOF
chmod u+x tmp.sh
echo \#!/bin/bash >tmp.sh
echo convert -size 90x60 canvas:white -size 90x30 gradient: -append -rotate 90 \\ >>tmp.sh
for i in *.jpg
do
echo $i -resize 90x90\! -clone 0 -compose CopyOpacity +matte -composite -repage +60+0 \\ >>tmp.sh
done
echo -compose over -mosaic overlap_series.jpg >>tmp.sh
./tmp.sh

