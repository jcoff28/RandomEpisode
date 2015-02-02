#!/bin/bash

COUNT=1
while getopts "c:" option; do 
	case $option in 
		c) COUNT=${OPTARG};; 
	esac 
done

files="$(find . -type f \( -name "*.avi" -o -name "*.mpg" -o -name "*.wmv" \) -printf '%p\n' | sort -R | head -$COUNT)"
echo "$files"
export DISPLAY=:0
vlc --fullscreen --quiet $files vlc://quit

######################################
exit 0
######################################
