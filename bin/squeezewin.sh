#!/bin/bash

BSPCDF() {
	# shorthand
	bspc config "$@"
}

pmp() {
	# some caps
	ans="$(($1+$2))"
	case $3 in
		-top ) [ ${ans} -lt 26 ] && ans=26 || {
				[ ${ans} -gt 150 ] && ans=150
				} ;;
		* ) [ ${ans} -lt 4 ] && ans=4 || {
				[ ${ans} -gt 150 ] && ans=150
				} ;;
	esac
	# result
	echo "${ans}"
}

# querry current values
top_padding_curr="$(BSPCDF top_padding)"
left_padding_curr="$(BSPCDF left_padding)"
right_padding_curr="$(BSPCDF right_padding)"
bottom_padding_curr="$(BSPCDF bottom_padding)"

BSPCDF top_padding $(pmp ${top_padding_curr} $1 -top)
BSPCDF bottom_padding $(pmp ${bottom_padding_curr} $1)
BSPCDF right_padding $(pmp ${right_padding_curr} $1)
BSPCDF left_padding $(pmp ${left_padding_curr} $1)
