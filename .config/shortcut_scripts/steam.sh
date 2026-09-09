#!/usr/bin/bash

window="$(kdotool search steam -n -l 1)"
if [[ $window == "" ]]; then 
	steam
else 
	kdotool windowactivate $window	
fi
