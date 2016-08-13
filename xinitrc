#!/bin/bash
# For environment variables and such:
source ~/.bashrc
source ~/.bash_aliases
initDesktop() {
	# Keyboard:
		setxkbmap -model pc105 -layout gb
	# Alleged java fix:
		export _JAVA_AWT_WM_NONREPARENTING=1
	# Colours and sound
		xrdb .Xresources # load xcolors
		# bars::
		export barBG=$(xrdb -query | grep "*background" | awk '{print $NF}')
		export barFG=$(xrdb -query | grep "*foreground" | awk '{print $NF}')
		pulseaudio --start
	# Mittigate vims stupidity with external clipboard
		keratin -d
	# speed up key repeat rate
		xset r rate 370 150
	# urxvt daemon
		urxvtd -q -f -o & 
	# compton
		compton &
	# hide mouse
		unclutter -idle 2 &
}
initBspwm() {
	# remove text file if it exists
		[ -e $HOME/.local/sxhkd.log ] && rm $HOME/.local/sxhkd.log
	# keybinding stuff
		sxhkd -c $HOME/.config/sxhkd/sxhkdrc.bsp-git &2> $HOME/.local/sxhkd.log
	# java fix
		wmname LG3D
	# wall
		case $1 in
			blend ) blend ;;
			blur ) fehwall blur ;;
			sharp ) fehwall sharp ;;
			* ) blend ;;
		esac
	# wm
		exec bspwm -c $HOME/.config/bspwm/bspwmrc
}
# start bspwm
initDesktop
initBspwm $@
