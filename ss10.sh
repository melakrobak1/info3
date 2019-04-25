#!/bin/bash
set -e
mkdir -p results9
cd results9
rm -f *
cp ../drop/*.jpg ./
for i in *.jpg
do
        convert $i -size 100x100 $i 
done 
k=0
for i in *.jpg
do
cat >conv$k.c <<EOF
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int m,n=100;
	int sizetab=m*n;
	FILE *fp;
	fp=fopen("$i", "r");
EOF
echo >>conv$k.c
echo	unsigned char \*tab$k\; >>conv$k.c
echo	tab$k=malloc\(sizetab*sizeof\(unsigned char\)\)\; >>conv$k.c
echo	"for" \(int j=0\; j\<sizetab\; j++\)\{ >>conv$k.c
echo		tab$k\[j\]=255*j\/\(sizetab-1\)\; >>conv$k.c
echo	\} >>conv$k.c
echo	fwrite\(tab$k, sizeof\(unsigned char\), sizetab, stdout\)\; >>conv$k.c
echo	free\(tab$k\)\;  >>conv$k.c
echo	fclose\(fp\)\; >>conv$k.c
echo return\(0\)\;\} >>conv$k.c
echo >>conv$k.c

	gcc conv$k.c -o obrazek$k.out
	./obrazek$k.out >obrazekb$k
	

cat >convb$k.c <<EOF1
#include <stdio.h>
#include <math.h>
#include <stdlib.h>

int main() {
	int m,n=100;
	int sizetab=m*n;
EOF1
echo	unsigned char \*tabb$k\; >>convb$k.c
echo	FILE \*fq\; >>convb$k.c
echo	FILE \*fr\=fopen\(\"obrazekbrev$k\", \"w\"\)\; >>convb$k.c
echo	fq=fopen\(\"obrazekb$k\", \"r\"\)\; >>convb$k.c
echo	tabb$k=malloc\(sizetab*sizeof\(unsigned char\)\)\; >>convb$k.c
echo  	fread\(tabb$k, sizeof\(unsigned char\), sizetab, fq\)\; >>convb$k.c
echo	"for" \(int j=0\; j\<sizetab\; j++\)\{ >>convb$k.c
echo		tabb$k\[j\]=\(unsigned char\)fabs\(\(double\)\(tabb$k\[j\]\-255\)\)\; >>convb$k.c
echo	\} >>convb$k.c
echo	"printf(\"%c\",tabb"$k"[0]);" >>convb$k.c
echo	fwrite\(tabb$k, sizeof\(unsigned char\), sizetab, fr\)\; >>convb$k.c
echo	free\(tabb$k\)\; fclose\(fq\)\; fclose\(fr\)\; >>convb$k.c
echo return\(0\)\;\} >>convb$k.c
echo >>convb$k.c
	gcc convb$k.c
	

	convert -size 100x100 -depth 8 gray:obrazekbrev$k obrazekbrev$k.jpg
	rm -f obrazekb$k obrazek$k.out obrazekb$k.out
	k=$((k+1))
done
