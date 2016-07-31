#!/bin/bash

config_dotslist={"bspwm" "qutebrowser" "compton.conf" "gtk-2.0" "gtk-3.0" "lemonbuddy" "sxhkd" "zathura"}

for i in ${config_dotslist[@]}
do
	cp -r "$HOME/.config/${i}" "$HOME/.dotfiles/dotfiles/."
done 
