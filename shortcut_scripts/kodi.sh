#!/usr/bin/bash

window="$(kdotool search kodi -n -l 1)"
if [[ $window == "" ]]; then 
	kodi
else 
	kdotool windowactivate $window	
fi
