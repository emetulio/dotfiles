#! /usr/bin/env python

import os
import sys

def echo(msg):
    os.system('echo -n "' + str(msg) + '"')

def out(n):
    os.system("tput setab " + str(n) + "; echo -n " + ("\"% 4d\"" % n))
    os.system("tput setab 0")

if os.getenv("TERM") in ("xterm", "screen"):
    os.putenv("TERM", os.getenv("TERM") + "-256color")

try:
    # normal colors 1 - 16
    os.system("tput setaf 16")
    for n in range(8):
        out(n)
    echo("\n")
    for n in range(8, 16):
        out(n)

    echo("\n")
    echo("\n")

    y=16
    while y < 256:
        for z in range(0,18):
            out(y)
            y += 1
            if y >= 256: break

        echo("\n")

    echo("\n")
finally:
    os.system("tput init")
