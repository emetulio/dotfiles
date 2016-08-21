#!/bin/sh

if [ $# -ne 1 ]
then
    echo "Usage $0 <package_name>"
    exit 1 
fi

#search packages with apt-cache search
apt-cache search $1 | grep -v ^lib | sort

