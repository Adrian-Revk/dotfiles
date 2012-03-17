#!/bin/bash

vol=`amixer get Master | grep "Front Left:" | awk -F "[" '{print $2}' | sed 's/%]//'`

if [ $vol == "0" ]; then
    echo "Mute"
else
    echo $vol
fi
