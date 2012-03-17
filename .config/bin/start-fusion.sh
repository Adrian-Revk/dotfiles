#!/bin/bash

# Thunar daemon
thunar --daemon &

# Urxvt Daemon
urxvtd -q -f -o &

# Power Manager
xfce4-power-manager &

# WICD Network Manager
wicd-gtk &

# MPD
mpd &

# Enable Numlock
numlockx on

# Avant-Window-Navigator
avant-window-navigator &

# Compiz Fusion
fusion-icon
