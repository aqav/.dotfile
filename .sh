[[ "$-" != *i* ]] && return

eval "$(lua ~/.dotfile/lib/z.lua  --init bash)"
export _ZL_ECHO=1
export _ZL_ADD_ONCE=1
export _ZL_MATCH_MODE=1
export _ZL_HYPHEN=1

if [ -n "$BASH_VERSION" ]; then
    export PS1='\[\e[1;35m\]\u@\h \[\e[1;32m\]$(_collapsed_pwd)\[\e[1;35m\]\$ \[\e[0m\]'
else
    export PROMPT='%F{5}%B%n@%m%b%f %F{2}%B$(_collapsed_pwd)%b%f%F{5}%B$%b%f '
fi
function _collapsed_pwd() {
    local pwd="$1"
    local home="$HOME"
    local size=${#home}
    [[ $# == 0 ]] && pwd="$PWD"
    [[ -z "$pwd" ]] && return
    if [[ "$pwd" == "/" ]]; then
        echo "/"
        return
    elif [[ "$pwd" == "$home" ]]; then
        echo "~"
        return
    fi
    [[ "$pwd" == "$home/"* ]] && pwd="~${pwd:$size}"
    if [[ -n "$BASH_VERSION" ]]; then
        local IFS="/"
        local elements=($pwd)
        local length=${#elements[@]}
        for ((i=0;i<length-1;i++)); do
            local elem=${elements[$i]}
            if [[ ${#elem} -gt 1 ]]; then
                elements[$i]=${elem:0:1}
            fi
        done
    else
        local elements=("${(s:/:)pwd}")
        local length=${#elements}
        for i in {1..$((length-1))}; do
            local elem=${elements[$i]}
            if [[ ${#elem} > 1 ]]; then
                elements[$i]=${elem[1]}
            fi
        done
    fi
    local IFS="/"
    echo "${elements[*]}"
}

export BAT_THEME="ansi"

alias ls='ls --color=auto'
alias ll='ls -Alh --color=auto'
alias cls='clear'

alias vi='nvim'
alias vim='nvim'

alias fzf='fzf -m'
export FZF_DEFAULT_OPTS='--layout=reverse --info=inline'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
