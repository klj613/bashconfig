# If not running interactively, don't do anything
[[ $- != *i* ]] && return

get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

get_current_sha() {
    git rev-parse HEAD 2> /dev/null
}

parse_git_info() {
    branch=$(get_git_branch)

    if [ ${#branch} -gt 0 ]; then
        echo "\342\224\200[\
\[\033[0;34m\]$(get_git_branch)\
 \033[0;36m\]$(get_current_sha)\
\033[0;37m\]]"
    fi
}

parse_path_info() {
    echo "\342\224\200[\[\033[0;32m\]\w\[\033[0;37m\]]"
}

parse_user_info() {
    echo "\[\033[0;37m\]\342\224\214\342\224\200\
\$([[ \$? != 0 ]] && echo \"[\[\033[0;31m\]\342\234\227\[\033[0;37m\]]\342\224\200\")[\
$(if [[ ${EUID} == 0 ]]; then echo '\[\033[0;31m\]\h'; else echo '\[\033[0;33m\]\u\[\033[0;37m\]@\[\033[0;96m\]\h'; fi)\
\[\033[0;37m\]]"
}

set_bash_prompt() {
    PS1="\
$(parse_user_info)\
$(parse_path_info)\
$(parse_git_info)\
\n\[\033[0;37m\]\342\224\224\342\224\200\342\224\200\342\225\274 \[\033[0m\]"
}

PROMPT_COMMAND=set_bash_prompt

alias ls='ls --color=auto'
alias ll='ls -alF'
