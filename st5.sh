#!/bin/bash
set -e
#Policzyc pliki o rozsz .dat .txt .sh .Skrypt powinien podawac liczbe
#plikow znajdujacych sie w folderze podanym jako argument skryptu.
#Zakladamy, ze istneje co najmniej 1 plik o danym rozsz.



cd a5
d=$(ls -1 | wc -l)
if [ "$d" -eq "$1" ]
then
	j1=0
	for i in *.txt
	do
		j1=$(expr $j1 + 1)
	done
	j2=0
	for i in *.dat
	do
                j2=$(expr $j2 + 1)
        done
	j3=0
	for i in *.sh
        do
                j3=$(expr $j3 + 1)
        done
	echo "Number of .txt files $j1"
	echo "Number of .dat files $j2"
	echo "Number of .sh files $j3"
else
	echo "Liczba argumentow nierowna liczbie plikow"
fi 
 




