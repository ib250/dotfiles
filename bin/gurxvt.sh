#!/bin/bash

gurxvt() {
	# set things up
		urxvtc -name $1
		PFW="$(xdo id -n ${1})"
		bspc node ${PFW} -t floating -l above -g sticky
		bspc config -n ${PFW} border_width ${2}
}

case $1 in
	pullup ) 
			classname="URxvtQuake"
			gurxvt "${classname}" 0 && {
			PFW="$(xdo id -n ${classname})"
			# snap
			snap.sh j ${PFW} "+" && wtf ${PFW} & TPID2=$!
			# wait for the process to complete
			wait ${TPID2}
			} && bspc node -f "${PFW}"
		;;
	center )
			classname="URxvtRun"
			gurxvt "${classname}" 5 && {
			PFW="$(xdo id -n ${classname})"
			wtf ${PFW} & TPID2=$!
			# wait for the process to complete
			wait ${TPID2}
			} && bspc node -f "${PFW}"
		;;
esac

## todo: find a way to make this togglable
