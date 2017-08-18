#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# some evironment variable stuff
#PANEL_FIFO=/home/ismail/.local/dzenfifo
PANEL_HEIGHT=20
PANEL_FONT="Terminal:size=10:bold"
PANEL_WM_NAME=bspwm_panel
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME

# add .local/bin to path
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/bspwm/panel
# add matlab
export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre
# andorid studio
export ANDROID_HOME=/opt/android-studio/plugins/android/lib
#-------------------------------

# Editor variable
export EDITOR='vim'

# ZDOTDIR
export ZDOTDIR=$HOME
#PS1='[\u@\h \W]$' the old one
CME="$(tput setaf 1)"
RST="$(tput sgr0)"
ARROW=$'\u2263'
me='$' #$USER
PS1="${CME}$me${RST} \W ${CME}$ARROW${RST}\n"

# some personal aliases
source /home/ismail/.bash_aliases

# stack completion
eval "$(stack --bash-completion-script stack)"
