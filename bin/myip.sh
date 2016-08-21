#!/bin/sh

#get the current outside IP adress

CMD="wget curl"
URL=https://wtfismyip.com/text

for c in $CMD
do
    if [ $(which $c) ]
    then
        $c $URL
        break
    fi
done

