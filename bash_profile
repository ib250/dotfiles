#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# environment variables

# bspwm stuff
PANEL_FIFO=/home/ismail/.local/dzenfifo
PANEL_HEIGHT=20
PANEL_FONT="Terminal:size=10:bold"
PANEL_WM_NAME=bspwm_panel
mymonitor='eDP1'
export PANEL_FIFO PANEL_HEIGHT PANEL_FONT PANEL_WM_NAME mymonitor
#
# add .local/bin and panel to path
export PATH=$PATH:$HOME/.local/bin:$HOME/.config/bspwm/panel
export BROWSER='qutebrowser'

## add matlab
#export MATLAB_JAVA=/usr/lib/jvm/java-7-openjdk/jre
