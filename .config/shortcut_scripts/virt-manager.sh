#!/usr/bin/bash

window="$(kdotool search virt-manager -c -l 1)"
if [[ $window == "" ]]; then 
	virt-manager
else 
	kdotool windowactivate "$window"
fi
