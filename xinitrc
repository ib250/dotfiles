#!/bin/bash

# For environment variables and such:
source ~/.bashrc
source ~/.bash_aliases

# common configuration
initDesktop() {
	setxkbmap -model pc105 -layout gb # Keyboard:
	export _JAVA_AWT_WM_NONREPARENTING=1 # Alleged java fix:
	# Colours and sound 
	xrdb .Xresources # load xcolors
	export QT_STYLE_OVERRIDE='gtk2'
	# bars::
	export barBG=$(xrdb -query | grep "*background" | awk '{print $NF}')
	export barFG=$(xrdb -query | grep "*foreground" | awk '{print $NF}')
	pulseaudio --start #...
	#mpd &
	# Mittigate vims stupidity with external clipboard manager
	keratin -d
	# speed up key repeat rate
	xset r rate 370 150
	# dpms opts
	xset s off -dpms
	# urxvt daemon
	urxvtd -q -f -o & 
	# hide mouse
	unclutter -idle 1 &
  # wall
	blend ${blend_options} &
}

# bspwm specific stuff
initBspwm() {
	[ -e $HOME/.local/sxhkd.log ] && rm $HOME/.local/sxhkd.log 
	sxhkd &2> $HOME/.local/sxhkd.log # keybinding stuff
	wmname LG3D # java fix
	exec bspwm -c $HOME/.config/bspwm/bspwmrc # wm
}

initDesktop
# start bspwm
initBspwm
