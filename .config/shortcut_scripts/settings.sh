#!/usr/bin/bash

window="$(kdotool search ssystemsetting -n -l 1)"
if [[ $window == "" ]]; then 
	systemsettings
else 
	kdotool windowactivate $window	
fi
