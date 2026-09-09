#!/usr/bin/bash

window="$(kdotool search thunar -n -l 1)"
if [[ $window == "" ]]; then 
	thunar
else 
	kdotool windowactivate $window	
fi
