#!/bin/bash

data=$( date )
mkdir -p s2/AA
cd s2/AA
mkdir -p BB CC
cd BB
echo $data  > file.txt
cd ../CC
mkdir -p DD
echo data > file.txt
