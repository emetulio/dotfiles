#!/bin/sh

#list all packages with 'rc' status in dpkg's list
dpkg -l |  sed 1,5d | grep -v ^ii | awk '{print $2}' | sort

