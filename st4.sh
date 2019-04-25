#!/bin/bash
set -e
#Napisz skrypt, ktory stowrzy liste zawierajaca pliki i foldery znajdujace
#sie w folderze podanym jako argument skryptu. Zapis otrzymana liste oraz godz uruchomienia skryptu
#do pliku


a=$(pwd)
b=$(find -name "$1")
cd $b
c=$(ls)
cd $a
e=$(date +%H:%M)

echo $c > plik4.txt
echo $e >> plik4.txt




