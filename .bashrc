# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -d "$HOME/.bashrc.d" ]; then
    for f in $HOME/.bashrc.d/*; do source $f; done
fi

case "$TERM" in
    rxvt-unicode-256color)
        TERM=rxvt-unicode
        ;;
esac
