#!/bin/sh

systemctl --user import-environment DISPLAY

if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

xset +fp /usr/share/fonts/local &
xset fp rehash &
xrdb ~/.Xresources
xsetroot -cursor_name left_ptr

# Launch some apps
nitrogen --restore &
dunst &
picom --experimental-backends &

sxhkd &
bspwm
