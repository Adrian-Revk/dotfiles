# ALL IS ALREADY DONE BY XFCE, dont uncomment if using xfce

# Thunar Daemon
thunar --daemon &

# URxvt Daemon
urxvtd -q -f -o &

# Wicd
wicd-client -t &

# Power manager
(sleep 2 && xfce4-power-manager) &

# MPD
mpd &

# conky
conky &

# Numlock
numlockx on

# layouts
setxkbmap -layout us,ca
setxkbmap -option grp:alt_shift_toggle

# tablet layout
xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger pad" ScrollDistance 150
xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger pad" Button 1 "key shift"
xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger pad" Button 2 "key alt"
xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger pad" Button 3 "key control"
xsetwacom --set "Wacom Bamboo 16FG 4x5 Finger pad" Button 4 "key space"

# Front channel ALSA
amixer -c 0 set Front 65%
# AWESOME WM
exec ck-launch-session dbus-launch awesome

# COMPIZ WM
#unset LIBGL_ALWAYS_INDIRECT; exec ck-launch-session dbus-launch fusion-icon

# DWM launcher
#exec ck-launch-session dbus-launch ~/.config/dwm/bin/startdwm

# XFCE4 LAUNCHED BY GDM3 DIRECTLY FROM INITTAB!!!!!!!!!!!!
#exec ck-launch-session dbus-launch startxfce4
