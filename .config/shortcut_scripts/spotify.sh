#!/usr/bin/bash

window="$(kdotool search spotify-launcher -n -l 1)"
if [[ $window == "" ]]; then 
	spotify-launcher
else 
	kdotool windowactivate $window	
fi
