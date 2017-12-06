#!/bin/bash

pac=$(checkupdates | wc -l)

check=$((pac))
if [[ "$check" != "0" ]]
then
    echo "%{F#FFFF00}%{F-} $pac"
else
	echo "%{F#FFFF00}%{F-} 0"
fi
