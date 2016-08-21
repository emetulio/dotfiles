#! /bin/bash

#+-------------------------------------------------------+
#|          decrypt my personal file of passwords        |
#|                                                       |
#| USAGE:                                                |
#| decrypt.sh <file_of_passwords.crypt> <password>       |
#| both arguments are mandatory                          |
#+-------------------------------------------------------+

#verify the number of arguments
EXPECTED_ARGS=2

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` <file_of_passwords> <password>"
  exit 1
fi

# array with decrypted file
sourcef=($(openssl aes-256-cbc -d -a -salt -pass pass:$2 -in $1))

#number of items(lines in file) in array sourcef
max=$(( ${#sourcef[*]} - 1 ))

#print decrypted file with reverse password
for i in $(seq 0 $max)
do
    if echo ${sourcef[$i]} | grep ^-- > /dev/null ; then
	echo ${sourcef[$i]} | rev
    else
	echo ${sourcef[$i]}
    fi
done

exit 0

# ${arr[*]}         # All of the items in the array
# ${!arr[*]}        # All of the indexes in the array
# ${#arr[*]}        # Number of items in the array
# ${#arr[0]}        # Length of item zero