#! /bin/bash

#+-------------------------------------------------------+
#|            backup my personal dot files               |
#|                                                       |
#| USAGE:                                                |
#| bkdotfiles.sh                                         |
#|                                                       |
#+-------------------------------------------------------+


# array with dotfiles or dotdirectory to backup
LISTBACKUP=( .bash* .conkyrc .emacs* .gconf .gnome* .gnupg .gtk* .gvfs .notion .profile .screenrc .ssh .w3m .X* .xinitrc )

#recorrer la lista de backup e ir descartando los archivos/directorios que existan, para dejar solo la lista de los que si se podran respaldar



#echo "The following files/directories are going to be backed up:"
echo ${LISTBACKUP[*]} | tr ' ' '\n'


#tar -cjf dotfiles.tar.bz2 ${listbackup[*]}



# arithmetical operation
#sum=$(($sum + $num ))

# change third line for 'new text'
#cat $1 | sed '3 s/.*/new  text/g'

# cut -f 1 == awk '{print $1}'

# ${arr[*]}         # All of the items in the array
# ${!arr[*]}        # All of the indexes in the array
# ${#arr[*]}        # Number of items in the array
# ${#arr[0]}        # Length of item zero
