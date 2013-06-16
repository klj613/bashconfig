[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ ! -z "$TMUX" ]] && return

eval $(ssh-agent)

pulseaudio --start
startx ; vlock
