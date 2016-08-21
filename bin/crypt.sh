#! /bin/bash

#+-------------------------------------------------------+
#|            crypt my personal file of passwords        |
#|                                                       |
#| USAGE:                                                |
#| crypt.sh <file_of_passwords> <password>               |
#| both arguments are mandatory                          |
#+-------------------------------------------------------+

#verify the number of arguments
EXPECTED_ARGS=2

if [ $# -ne $EXPECTED_ARGS ]
then
    echo "Usage: `basename $0` <file_of_passwords> <password>"
    exit 1
fi

#chksumsource=$(shasum -a 512 $1 | cut -d ' ' -f 1)
#echo $chksumsourceif [ $# -ne $EXPECTED_ARGS ]

#sourcefile=($(cat $1))
#echo ${sourcefile[*]}

# array with number of lines that contain passwords
plines=($(grep -ne -- $1 | cut -d : -f 1))
#echo ${plines[*]}

# array of reverse passwords
ssap=($(grep -e -- $1 | rev))
#echo ${ssap[*]}

# generate and store all commands that sed will execute
# in order to change passwords for reverse passwords
max=$(( ${#plines[*]} - 1 ))
for i in $(seq 0 $max)
do
    sedcmd[$i]="-e ${plines[$i]}s:.*:${ssap[$i]}:"
done
#echo ${sedcmd[*]}

revfile=($(sed ${sedcmd[*]} $1))
#echo ${revfile[0]}
echo ${revfile[*]} | openssl aes-256-cbc -e -a -salt -pass pass:$2 > $1.crypt

exit 0

# arithmetical operation
#sum=$(($sum + $num ))

# change third line for 'new text'
#cat $1 | sed '3 s/.*/new  text/g'

# cut -f 1 == awk '{print $1}'

# ${arr[*]}         # All of the items in the array
# ${!arr[*]}        # All of the indexes in the array
# ${#arr[*]}        # Number of items in the array
# ${#arr[0]}        # Length of item zero
