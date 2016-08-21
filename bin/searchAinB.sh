#!/bin/sh
 
# buscarAenB.sh
# buscar la lista A en B, donde:
# A es el 1er argumento, es un archivo con una lista de palabras, un palabra en cada linea
# B es el 2do argumento, es un archivo con una lista de palabras, un palabra en cada linea
 
# Se puede entender el resultado de este script como:
# cuales elementos de la lista A no existen en B


# si no hay dos argumentos, salir
if [ $# -lt 2 ]; then
    echo " usage:" $0 "<filelist1> <filelist2>"
    echo
    exit 1
fi

# si no existe alguno de los archivos, salir
for i in $@
do
    if [ ! -e $i ]; then
        echo "file <"$i"> does not exist"
        echo
        exit 1
    fi
done

tmpfile1=$1.$$
tmpfile2=$2.$$

# eliminar espacios al inicio y al final (sed)
# ajusta una sola palabra por linea (tr)
# ordenar las listas y eliminar duplicados (sort)
sed -e 's/^[[:blank:]]*//;s/[[:blank:]]*$//' $1 | tr ' ' '\n' | sort -u > $tmpfile1
sed -e 's/^[[:blank:]]*//;s/[[:blank:]]*$//' $2 | tr ' ' '\n' | sort -u > $tmpfile2

# buscar elementos de A en B y reportar los faltantes
grep -xvf $tmpfile1 $tmpfile2
 
# eliminar archivos temporales
rm $tmpfile1 $tmpfile2

