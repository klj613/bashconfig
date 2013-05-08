[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

eval $(ssh-agent)

pulseaudio --start
startx
