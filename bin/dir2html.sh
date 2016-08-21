#!/bin/bash

# usage: dir2html.sh [dir] > [filename.html]
if [ $# -ne 1 ]
then
    echo "Usage $0 <filename.html>"
    exit 1 
fi


INDEX=`ls -1 $1 | sed "s/^.*/ <li\>\<a\ href=\"&\"\>&\<\\/a\>\<\\/li\>/"`
echo "<html>
  <head><title>Index of $1</title></head>
  <body>
    <h2>Index of $1</h2>
    <hr>
    <ui>
$INDEX
    <ui>
  </body>
</html>"
