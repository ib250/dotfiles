#!/bin/bash

gurxvt() {
	# set things up
		#borderColor=$(xrdb -query | grep "*color9" | awk '{print $NF}')
		urxvtc -name $1
		PFW="$(xdo id -n ${1})"
		bspc node ${PFW} -t floating -l above -g sticky
		bspc config -n ${PFW} border_width ${2}
}

case $1 in
	pullup ) 
			classname="URxvtQuake"
			gurxvt "${classname}" 1 && {
			PFW="$(xdo id -n ${classname})"
			# snap
			snap.sh j ${PFW} "+" && wtf ${PFW} & TPID2=$!
			# wait for the process to complete
			wait ${TPID2}
			} && bspc node -f "${PFW}"
		;;
	center )
			classname="URxvtRun"
			gurxvt "${classname}" 1 && {
			PFW="$(xdo id -n ${classname})"
			wtf ${PFW} & TPID2=$!
			# wait for the process to complete
			wait ${TPID2}
			} && bspc node -f "${PFW}"
		;;
esac

## TODO: find a way to make this togglable
