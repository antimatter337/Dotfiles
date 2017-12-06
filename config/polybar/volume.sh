#!/bin/bash

white='b7b8b9'
green='31a354'
red='ff0000'
blue='0000ff'

if [ "$(pamixer --get-mute)" = "true" ]; then
   echo " %{F$red u$white +u}  (muted) %{F- u- -u}"
else
    volume="$(pamixer --get-volume)"
    if [ "$volume" == 0 ]; then
       echo -e "%{F$white u$blue +u}  %{F-}$volume% %{u- -u}"
    elif [ "$volume" -lt 50 ]; then
       echo -e "%{F$white u$blue +u}  %{F-}$volume% %{u- -u}"
    else
       echo -e "%{F$white u$blue +u}  %{F-}$volume% %{u- -u}"
    fi
fi
