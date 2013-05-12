[[ -f ~/.bashrc ]] && . ~/.bashrc

eval $(ssh-agent)

pulseaudio --start
startx
