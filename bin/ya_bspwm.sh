#!/bin/bash
#
function blackmagic() {
	# do some things
	case $1 in
		[ou]*)
			X=$(echo -e "$1" | sed -e "s/[ou]//g")
				echo -e "<span foreground=\"$cyn\">$Y$X$Y</span>"
				#echo -e "+$X "
			;;
		[OU]*)
			X=$(echo -e "$1" | sed -e "s/[OU]//g")
				echo -e "<span foreground=\"$cyn\" >$Y$X$Y</span>"
				#echo -e "++$X "
			;;
		f*)
			X=$(echo -e "$1" | sed -e "s/f//g")
				echo -e "<span>$Y$X$Y</span>"
				#echo -e "-$X "
			;;
		F*)
			X=$(echo -e "$1" | sed -e "s/F//g")
				echo -e "<span>$Y$X$Y</span>"
				#echo -e "--$X "
			;;
		[WwMm]*)
			;;
	esac
}

# fifo stuff
PANEL_FIFO=/home/ismail/.local/dzenfifo
[ -e "$PANEL_FIFO" ] && rm "$PANEL_FIFO"
mkfifo "$PANEL_FIFO"
# the goods
bspstat=$(bspc subscribe | sed -e "s/:/ /g" < $PANEL_FIFO)
# the colors
colordir="/home/ismail/.termcolors/xuse"
cyn=$(cat $colordir | grep -i " red" | awk '{print $3}')
bbg=$(cat $colordir | grep -i " bg" | awk '{print $3}')
# the text
Y="   "
yabarstat=""
# the trips
for ID in $bspstat; do
	yabarstat="$yabarstat$(blackmagic $ID)"
done
echo "$yabarstat"


