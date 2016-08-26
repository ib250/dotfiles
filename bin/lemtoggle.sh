#!/bin/bash

# start
function lemstart() {
	currentpadding="$(bspc config -m eDP1 top_padding)"
	bspc config -m eDP1 top_padding $((${currentpadding}+20))
	lemonbuddy_wrapper top
}
# stop
function lemstop() {
	currentpadding="$(bspc config -m eDP1 top_padding)"
	lemonbuddy_terminate noconfirm && bspc config -m eDP1 top_padding $((${currentpadding}-20))
}

export barBG=$(xrdb -query | grep "*background" | awk '{print $NF}')
export barFG=$(xrdb -query | grep "*foreground" | awk '{print $NF}')

# zero input case just toggle start stop
case $1 in
	start ) ( pidof lemonbar ) || lemstart ;;
	stop ) ( pidof lemonbar ) && lemstop ;;
	toggle ) ( pidof lemonbar ) && lemstop || lemstart ;;
	reload|* )
		( pidof lemonbar ) && lemstop
		lemstart
		;;
esac
