#!/bin/bash

gurxvt() {
	# set things up
		urxvtc -name "URxvtQuake"
		bspc node -t floating -l above -g sticky
		bspc config -n focused border_width 0
}

gurxvt && {
	PFW=$(pfw)
	# snap
	snap.sh j ${PFW} "+" && {
	wtf ${PFW} & TPID=$!
	}
	# wait for the process to complete
	wait ${TPID}
} && sleep 2 && bspc node -f south.sticky

## todo: find a way to make this togglable
