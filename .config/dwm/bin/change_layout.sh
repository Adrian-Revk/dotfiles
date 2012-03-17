#!/bin/bash

layout_file="/home/revk/.config/dwm/bin/layout"
curr_layout=`cat $layout_file`

if [ "$curr_layout" == "us" ]; then
    setxkbmap -layout fr
    echo "fr" > $layout_file
else
    setxkbmap -layout us
    echo "us" > $layout_file
fi
