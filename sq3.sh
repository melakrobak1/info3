#!/bin/bash
cd s3
for i in *.txt
do
  cp $i $1_$i
done

