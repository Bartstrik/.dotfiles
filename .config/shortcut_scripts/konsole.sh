#!/usr/bin/bash

window="$(kdotool search konsole -n -l 1)"
if [[ $window == "" ]]; then 
	konsole
else 
	kdotool windowactivate $window	
fi
