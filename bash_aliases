# Aliases

alias climatlab='matlab -nosplash -nodesktop'
#alias v='vimpager'
alias r='ranger'
alias c='clear'
alias l='ls -lAs --color=always'
alias ls='ls  --color=always'
alias ll='ls -l --color=always'
alias rmi='rm -iv'
alias cpi='cp -iv'
alias mvi='mv -iv'
alias sxconf='cat ~/.config/sxhkd/sxhkdrc \n'
alias xsxconf='vim $HOME/.config/sxhkd/sxhkdrc.bsp-git'
alias ofoam='source /opt/OpenFOAM/OpenFOAM-3.0.1/etc/bashrc'
alias treee='tree -C'
alias trls='tree -C -L 1'
alias wpag='sudo wpa_gui'
alias quickLuaTex='latexmk -lualatex'
alias quickPdfTex='latexmk -pdf'
alias alsi='alsi -n'
alias q='exit'
alias rezsh='source $HOME/.zshrc'
alias tty-clock='tty-clock -b'
alias unixporn='rtv -s /r/unixporn'

# some possible useless functions
# function for bootable stuff i always forget
function ddboot() {
	echo "dd bs=\$\3 if=\$\1 of=\$\2 status=progress && sync"
}
# music
function fucktheskullofitunes() {
	mpd & MPD-PID=$!
	export MPD-PID
	ncmpcpp 
}
# not much use now that i've got locate but...
function doihave() {
	# the 2 input case
	[[ $# == 2 ]] &&	ls --all $1 | grep -i $2
	# the one input case
	[[ $# == 1 ]] && ls --all $(pwd) | grep -i $1
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
# colorblocks courtesy of linuxbbq
function colorblocks() {
    #NAMES="█████"
	 NAMES=">>"
    for f in $(seq 0 7); do
        echo -en "\033[m\033[$(($f+30))m ${NAMES}" # normal colors
    done
    echo	
    for f in $(seq 0 7); do
        echo -en "\033[m\033[1;$(($f+30))m ${NAMES}" # bold colors
    done
    echo -e "$rst\n"
}
# got too used to v for vim
function vimw() {
	[[ $# -lt 1 ]] && vim 2> /dev/null || \
		vimpager $@
}
alias v='vimw'
# for checking fonts when i'm tweaking
function somechars() {
	echo "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG\nthe quick brown fox jumps over the lazy dog\n1234567890\n!\"£$%^&*():{}@~<>?,.¬\`|\\\?/=-+_\n"
}
# dump list of packages for emergency purposes
function pacmanEmList() {
	packages="$HOME/packageList"
	[ -e "${packages}" ] && rm ${packages}
	pacman --query > ${packages}
}
# In the works but does what i need for now
function connectHDMI() {
	case $1 in
		+ )
			xrandr --output HDMI1 --auto --below eDP1
			export mymonitor="HDMI1"
			;;
		- )
			xrandr --output HDMI1 --off
			export mymonitor="eDP1"
	esac
			sh $HOME/.fehbg
}
