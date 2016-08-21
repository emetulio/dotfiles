#! /bin/sh

#+-------------------------------------------------------+
#|   reverse passwords in my personal file of passwords  |
#+-------------------------------------------------------+

# array of number of line where there are passwords
plines=(`grep -n -e -- $1 | cut -d : -f 1`)

# array of reverse passwords
ssap=(`grep -e -- $1 |  cut -d ' ' -f 2 | rev`)

# generate and store all commands that sed will execute
# in order to change passwords for reverse passwords
max=$(( ${#plines[*]} - 1))
for i in $(seq 0 $max)
do
    echo ${plines[$i]} s:.*:\-\- ${ssap[$i]} \-\-: >> sedcommands.tmp
done

sed -f sedcommands.tmp < $1
rm sedcommands.tmp

# arithmetical operation
#sum=$(($sum + $num ))

# change third line for 'new text'
#cat $1 | sed '3 s/.*/new  text/g'

# cut -f 1 == awk '{print $1}'

# ${arr[*]}         # All of the items in the array
# ${!arr[*]}        # All of the indexes in the array
# ${#arr[*]}        # Number of items in the array
# ${#arr[0]}        # Length of item zero
