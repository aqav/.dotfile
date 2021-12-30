# fish-like pwd
function fish_pwd() {
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

# X11
export DISPLAY=`cat /etc/resolv.conf | grep nameserver | awk '{print $2}'`:0

# alias
alias ls='ls --color=auto'
alias ll='ls --color=auto -lh'
alias lla='ls --color=auto -alh'
alias llat='ls --color=auto -alht'

alias cls='tput reset'

# function chpwd() {
#     if [[ "$PWD" != "$OLDPWD" ]]; then
#         lla;
#     fi
# }

cdls() {
    cd "$@";
    if [[ "$PWD" != "$OLDPWD" ]]; then
        lla;
    fi
}
alias cd='cdls'

zls() {
    z "$@";
    if [[ "$PWD" != "$OLDPWD" ]]; then
        lla;
    fi
}
alias z='zls'

rmls() {
    rm "$@";
    lla;
}
alias rm='rmls'

alias zb='z -b'
alias zf='z -I'

alias vi='nvim'
alias vim='nvim'

alias cat='bat'
