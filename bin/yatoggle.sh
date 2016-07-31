#!/bin/bash

# start
function yastart() {
	bspc config top_padding 17
	yabar -c $HOME/.config/yabar/yabar.conf.3
}
# stop
function yastop() {
	pkill yabar && bspc config top_padding 4
}

( pidof yabar ) && yastop || yastart
