#!/bin/sh


locale -a |
grep _ | #don't show nationalities
uniq -w5 | #merge available charmaps
while read lang; do
    echo -ne "$lang\t";
    locale_info=`LANG=$lang locale territory language 2>/dev/null`
    echo $locale_info | sed 's/\(.*\) \(.*\)/\1 (\2)/'
done |
sort -k2 #add -u to merge languages

