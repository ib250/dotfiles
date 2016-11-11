# Aliases
alias climatlab='matlab -nosplash -nodesktop'
alias r='ranger'
alias c='clear'
alias l='exa --long --all --git'
alias ll='exa --long --git'
alias rmi='rm -iv'
alias cpi='cp -iv'
alias mvi='mv -iv'
alias sxconf='cat ~/.config/sxhkd/sxhkdrc \n'
alias xsxconf='vim $HOME/.config/sxhkd/sxhkdrc'
alias ofoam='source /opt/OpenFOAM/OpenFOAM-3.0.1/etc/bashrc'
alias trls='exa -T -L 1'
alias tree='exa -T'
alias quickLuaTex='latexmk -lualatex'
alias quickPdfTex='latexmk -pdf'
alias alsi='alsi -n'
alias q='exit'
alias rezsh='rehash && source ~/.zshrc'
alias tty-clock='tty-clock -b'
alias unixporn='rtv -s /r/unixporn'
alias wslurn='slurm -i wlp8s0'
alias fucktheskullofitunes='mpd && ncmpcpp'
alias whichxuse='head -n2 $HOME/.termcolors/xuse && colorblocks'
alias DF='df -h /'

# some possibly useless functions
function ddboot() {
	# reminder for bootable stuff
	echo "dd bs=\$\3 if=\$\1 of=\$\2 status=progress && sync"
}
# not much use now that i've got locate but...
function doihave() {
	# the 2 input case
	[[ $# == 2 ]] &&	ls --all $1 | grep -i $2
	# the one input case
	[[ $# == 1 ]] && ls --all $(pwd) | grep -i $1
}
function fehwall() {
	comptontoggle start
	case $1 in
		blur )
			usethisone="$HOME/.wall.png"
			;;
		sharp )
			usethisone="$HOME/.sharp.png"
			;;
		* )
			usethisone="$HOME/.wall.png"
			;;
	esac
	feh --bg-fill "${usethisone}"
}
# set blurred wallpaper
function setblurredwall() {
	# 2 input case
	[[ $# == 2 ]] && hsetroot -fill $1 -blur $2
	# 1 input case
	[[ $# == 1 ]] && hsetroot -fill $1 -blur 3
	# 0 input case
	[[ $# == 0 ]] && {
		hsetroot -fill $(tail -n 1 ~/.fehbg | awk '{print $NF}' | sed -e "s/'//g") -blur 20
	}
}
function showwall() {
	feh $(tail -n 1 ~/.fehbg | awk '{print $NF}' | sed -e "s/'//g")
}
function colorblocks() {
	 NAMES="█████"
	 #NAMES=">>"
    for f in $(seq 0 7); do
        echo -en "\033[m\033[$(($f+30))m ${NAMES}" # normal colors
    done
    echo	
    for f in $(seq 0 7); do
        echo -en "\033[m\033[1;$(($f+30))m ${NAMES}" # bold colors
    done
    echo -e "$rst\n"
}
# got too used to v alias for vim
function vimw() {
	[[ $# -lt 1 ]] && vim 2> /dev/null || \
		vimpager $@
}
alias v='vimw'
# something to see how fonts behave on term
function somechars() {
	echo "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG\nthe quick brown fox jumps over the lazy dog\n1234567890\n!\"£$%^&*():{}@~<>?,.¬\`|\\\?/=-+_\n"
}
# dump a list of packages
function pacmanEmList() {
	packages="$HOME/packageList"
	[ -e "${packages}" ] && rm -f ${packages}
	pacman --query > ${packages}
}
# simple function to connect and disconnect HDMI
function connectHDMI() {
	case $1 in
		+ )
			xrandr --output HDMI1 --auto --below eDP1
			export mymonitor="HDMI1"
			;;
		- )
			xrandr --output HDMI1 --off
			export mymonitor="eDP1"
			;;
		* )
			echo "Invalid input use + to connect and - to disconnect"
			;;
	esac
	blend tile
	#feh  --image-bg black --bg-center $HOME/.wall.png
}
# dump the blurred wall
function walldump() {
	# in and out
	inputimg="$(tail -n 1 ~/.fehbg | awk '{print $NF}' | sed -e "s/'//g")"
	outputimg="$HOME/.wall.png"
	# conversion:
	[[ $1 = all ]] && convert -blur 50x50 ${inputimg} ${outputimg}
	# symlink orginal
	ln -s "${inputimg}" "$HOME/.sharp.png"
}
function comptontoggle() {
		case $1 in
			start ) ( pgrep compton ) || compton &> /dev/null ;;
			stop ) ( pgrep compton ) && pkill compton &> /dev/null ;;
			* ) ( pgrep compton ) && pkill compton || compton &> /dev/null ;;
		esac
}
function blend() {
	thebg="$(xrdb -query | grep "*background" | awk '{print $NF}')"
	thefg="$(xrdb -query | grep "*color0" | awk '{print $NF}')"
	wht="$(xrdb -query | grep "*color7" | awk '{print $NF}')"
	case $1 in
		tile ) 
			comptontoggle stop &> /dev/null
			xsetroot -bitmap "$HOME/.local/share/tiles/xbms/ammannTilingEdges.xbm"  -bg "${thebg}" -fg "${thefg}"
			;;
		tile-light ) 
			comptontoggle stop &> /dev/null
			xsetroot -bitmap "$HOME/.local/share/tiles/xbms/ammannTilingEdges.xbm"  -bg "${wht}" -fg "${thebg}"
			;;
		notile )
			comptontoggle stop &> /dev/null
			hsetroot -solid  "${thebg}"
			;;
		notile-light )
			comptontoggle stop &> /dev/null
			hsetroot -solid  "${wht}"
			;;
		* )
			comptontoggle start &
			hsetroot -solid  "${thebg}"
			;;
	esac
}
function startmatlab() {
	# found that some java annoyances persist without this
	bspc desktop -l monocle && {
	wmname LG3D && export _JAVA_AWT_WM_NONREPARENTING=1 && matlab "$@"
	}
}
function makecolors() {
	printheader() {
		echo "! $@ \n! bg fg blk bblk wht red grn ylw blu mag cyn"
	}
	makeandlink() {
		pathprefix="/home/ismail/.GitDots/ib250/${1}"
		printheader ${1} > ${pathprefix}
		ln -s ${pathprefix} $HOME/.termcolors/.
	}
	[ $# -eq 0 ] && echo "Must specify filename" || {
		for i in "$@" ; do
			makeandlink ${i}
		done
	}
}
function mypdflatex() {
	pdflatex -syntex=1 -interaction=nonstopmode "$(find . -name "*.tex")"
}
function mylualatex() {
	lualatex -syntex=1 -interaction=nonstopmode "$(find . -name "*.tex")"
}
function mybibtex() {
	bibtex "$(find . -name "*.aux")"
}
function updatezathurarc() {
	currbg=$(cat $HOME/.config/zathura/zathurarc.base | grep -i "default-bg" | awk '{print $NF}' | uniq)
	currfg=$(cat $HOME/.config/zathura/zathurarc.base | grep -i "default-fg" | awk '{print $NF}' | uniq)
	[ -e "$HOME/.config/zathura/zathurarc" ] && rm $HOME/.config/zathura/zathurarc
	cat $HOME/.config/zathura/zathurarc.base | sed -e "s/"${currbg}"/\""${barBG}"\"/;
																 s/"${currfg}"/\""${barFG}"\"/" > $HOME/.config/zathura/zathurarc
}
function lowerbar() {
	barid="$(xdo id -a mybar)"
	rootid="$(xdo id -a eDP1)"
	xdo below -t "${rootid}" "${barid}"
}
function showcolours() {
	case ${inputfile} in
		*png|jpg|jpeg ) colors -n ${numbers:-9} ${inputfile} ;;
		* ) cat ${inputfile} | awk '{print $NF}' | grep "#" ;;
	esac | hex2col
}
