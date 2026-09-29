#!/usr/bin/bash

window="$(kdotool search konsole -n -l 1)"
if [[ $window == "" ]]; then 
	date >> /home/bart/.config/shortcut_scripts/log.txt
	echo "$window" >> /home/bart/.config/shortcut_scripts/log.txt
	konsole
else 
	kdotool windowactivate "$window"
fi
