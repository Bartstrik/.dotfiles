#!/usr/bin/bash

window="$(kdotool search kicad -n -l 1)"
if [[ $window == "" ]]; then 
	kicad
else 
	kdotool windowactivate "$window"
fi
