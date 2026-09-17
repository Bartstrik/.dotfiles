#!/usr/bin/bash

window="$(kdotool search code-oss -c -l 1)"
if [[ $window == "" ]]; then 
	code-oss
else 
	kdotool windowactivate $window	
fi
