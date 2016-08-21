#!/bin/sh

#list all installed packages with dpkg (no libraries)
dpkg -l | grep ^ii | awk '{print $2}' | grep -v ^lib | sort

