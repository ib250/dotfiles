setwallbynodes() {
	[ $# -lt 0 ] && {
	setblurredwall $(tail -n 1 .fehbg | awk '{print $NF}' | sed -e "s/'//g") $1
	} || {
		echo "invalid use of setwallbynodes shell function"
	}
	return 0;
}
bspc query -N -d | xargs -I id -n 1 bspc node id -t {pseudo_tiled,tiled}
#bspc node -t pseudo_tiled
