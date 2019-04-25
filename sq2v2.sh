#!/bin/bash

data=$( date )
mkdir -p s2v2/AA
cd s2v2/AA
mkdir -p BB CC
cd BB
echo $data  > $1
cd ../CC
mkdir -p DD
echo data > $2



