#!/bin/bash

# start
function lemstart() {
	bspc config -m eDP1 top_padding 25
	lemonbuddy_wrapper top
}
# stop
function lemstop() {
	lemonbuddy_terminate noconfirm && bspc config -m eDP1 top_padding 4
}

# zero input case just toggle start stop
export barBG=$(xrdb -query | grep "*background" | awk '{print $NF}')
export barFG=$(xrdb -query | grep "*foreground" | awk '{print $NF}')
[ $# -lt 1 ] && {
	( pidof lemonbar ) && lemstop || lemstart
	return 0
} || {
	case $1 in
		start ) ( pidof lemonbar ) || lemstart ;;
		stop ) ( pidof lemonbar ) && lemstop ;;
		reload ) ( pidof lemonbar ) && lemstop && lemstart ;;
	esac
}
