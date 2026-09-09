#!/usr/bin/bash

window="$(kdotool search code -n -l 1)"
if [[ $window == "" ]]; then 
	code
else 
	kdotool windowactivate $window	
fi
