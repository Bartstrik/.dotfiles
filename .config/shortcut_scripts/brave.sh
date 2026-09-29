#!/usr/bin/bash

window="$(kdotool search brave -n -l 1)"
if [[ $window == "" ]]; then 
	echo "$window" >> ./log.txt
	brave
else 
	kdotool windowactivate "$window"
fi
