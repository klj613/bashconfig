[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ ! -z "$TMUX" ]] && return

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
    eval $(ssh-agent)
    pulseaudio --start
    startx ; vlock
fi
