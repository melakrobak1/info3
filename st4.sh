#!/bin/bash
set -e

a=$(pwd)
b=$(find -name "$1")
cd $b
c=$(ls)
cd $a
e=$(date +%H:%M)

echo $c > plik4.txt
echo $e >> plik4.txt




