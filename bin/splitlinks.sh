#!/bin/bash

numlinks=`wc -w $1 |awk '1{print $1}'`

for liga in $(jot $numlinks 1)
    do
    awk '1{print $'$liga'}' $1 >> $1.txt
done

rm $1
