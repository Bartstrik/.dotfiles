#!/usr/bin/bash

window="$(kdotool search zathura -n -l 1)"
if [[ $window == "" ]]; then 
	zathura
else 
	kdotool windowactivate $window	
fi
