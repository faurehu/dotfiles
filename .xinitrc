#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout gb -option compose:ralt
xmodmap ~/.Xmodmap

# This makes space a mod when combined with other keys
# reddit.com/r/i3wn/comments/5zpz69/using_space_bar_as_mod_is_life_changing
spare_modifier="Hyper_L"
xmodmap -e "keycode 65 = $spare_modifier"
xmodmap -e "keycode any = space"
xcape -e "$spare_modifier=space"

# Wallpaper
nitrogen --restore &

# Monitor positioning
# xrandr --output DP-1 --left-of DP-4 --rotate left

# Turning GPU light off
# nvidia-settings --assign GPULogoBrightness=0

# Compton i3 window shadowing
compton -o 0.6 -r 20 -l -30 -t -10 -cCGb --inactive-dim 0.1

conky -c ~/.config/conky/conky.conf

exec i3
