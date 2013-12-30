get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

get_current_sha() {
    git rev-parse HEAD 2> /dev/null
}

parse_git_info() {
    branch=$(get_git_branch)

    if [ ${#branch} -gt 0 ]; then
echo "$WHITE$LINE[$BLUE$(get_git_branch) $DULL_YELLOW$(get_current_sha)$WHITE]"
    fi
}

parse_path_info() {
    echo "$LINE$WHITE[$GREEN\w$WHITE]"
}

parse_user_info() {
    echo "$WHITE$TOP_LEFT_CORNER$LINE\
\$([[ \$? != 0 ]] && echo \"$WHITE[$RED\342\234\227$WHITE]\")\
$WHITE[$(if [[ ${EUID} == 0 ]]; then echo "$RED\h"; else echo "$DARK_YELLOW\u$WHITE@$LIGHT_YELLOW\h"; fi)$WHITE]"
}

set_bash_prompt() {
    TOP_LEFT_CORNER="\342\224\214"
    BOTTOM_LEFT_CORNER="\342\224\224"
    SQUARE="\342\225\274"
    LINE="\342\224\200"
    CLEARER="\[\033[0;37m\]"

    RED="\[\033[0;31m\]"
    WHITE="\[\033[0;37m\]"
    GREEN="\[\033[0;32m\]"
    DARK_YELLOW="\[\033[0;33m\]"
    LIGHT_YELLOW="\[\033[0;96m\]"
    DULL_YELLOW="\033[0;36m\]"
    BLUE="\[\033[0;34m\]"

PS1="\
$(parse_user_info)\
$(parse_path_info)\
$(parse_git_info)\
\n$WHITE$BOTTOM_LEFT_CORNER$LINE$LINE$SQUARE $CLEARER"
}

PROMPT_COMMAND=set_bash_prompt
