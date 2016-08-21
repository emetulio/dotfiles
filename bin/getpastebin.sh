#!/bin/sh

#given an url from pastebin, extract its raw text


#TODO validate that the last character is not /
RAW=$(echo $1 | rev | cut -f1 -d/ | rev)

curl -s http://pastebin.com/raw/${RAW}
