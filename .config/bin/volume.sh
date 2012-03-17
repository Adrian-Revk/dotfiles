#!/bin/bash
# Use amixer and mpd(ncmpdcpp)

function inc_vol {
    /home/revk/.config/bin/volume.rb up
}

function dec_vol {
    /home/revk/.config/bin/volume.rb down
}

function toggle_vol {
    /home/revk/.config/bin/volume.rb toggle
}

function mpd_play {
    ncmpcpp toggle
}

function mpd_stop {
    ncmpcpp stop
}

function mpd_next {
    ncmpcpp next
}

function mpd_prev {
    ncmpcpp prev
}

if [ $# -ne 1 ]; then
    exit 1
else
    case $1 in
        "up") inc_vol;;
        "down") dec_vol;;
        "mute") toggle_vol;;
        "play") mpd_play;;
        "stop") mpd_stop;;
        "next") mpd_next;;
        "prev") mpd_prev;;
        *) exit 1;
    esac
fi
        
