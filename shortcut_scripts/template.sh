#!/usr/bin/bash

window="$(kdotool search ~ -n -l 1)"
if [[ $window == "" ]]; then 
	~
else 
	kdotool windowactivate $window	
fi
