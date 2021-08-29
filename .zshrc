# ln -s ~/.dotfile/.zshrc ~/.zshrc

# -- common ---
[[ $- != *i* ]] && return    # don't do anything if not running interactively

source ~/.dotfile/.sh                 # source my common shell configuration

unsetopt beep                # no annoyed beep sound

HISTFILE=~/.zsh_history      # set zsh history file
HISTSIZE=1024                # set zsh history size in shell
SAVEHIST=4096                # set zsh history size in file

# -- promopt ---
setopt prompt_subst    # make zsh understands funtion
# left-prompt: user@host pwd$
export PROMPT='%F{black}%B%n@%m%b%f %F{blue}%B$(fish_pwd)%b%f%F{black}%B$%b%f '
# right-prompt: exit code
function exit_code() {
    local ec=$?
    if [[ $ec -ne 0 ]]; then
        echo "%F{red}%B$ec%b%f"
    else
        echo "%F{black}%B$ec%b%f"
    fi
}
export RPROMPT='$(exit_code)'

# -- completion ---
autoload -Uz compinit && compinit
_comp_options+=(globdots)                            # add hidden files & dirs into completions

eval "$(dircolors)"                                  # colour completions like 'ls --color=auto -al'
zstyle ':completion:*' \
    list-colors ${(s.:.)LS_COLORS}

# completion match case-sensitive, then case-insensitive, partial-word and substring
zstyle ':completion:*' \
    matcher-list \
    '' \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*' \
    'l:|=* r:|=*'

zstyle ':completion:*' menu select                   # enable completion select-menu
zmodload -i zsh/complist                             # enable 'menuselect' keybindings
bindkey -M menuselect 'h' vi-backward-char           # use vim-like operators in completion select-menu
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# --- plugins ---

# enable https://github.com/skywind3000/z.lua
# require lua:
# # sudo pacman -S lua
eval "$(lua ~/.zsh/z.lua/z.lua  --init zsh)"
export _ZL_ADD_ONCE=1          # update .zlua only if $PWD has changed
export _ZL_ADD_MATCH_MODE=1    # enable enhanced matching
export _ZL_HYPHEN=1            # treat '-' as a normal char rather than a lua keyword

# enable https://github.com/junegunn/fzf
source ~/.fzf.zsh
# default command to use when input is tty
export FZF_DEFAULT_COMMAND='fd --hidden --follow --type file'
# CTRL-T: paste the selected files and directories onto the command-line
export FZF_CTRL_T_COMMAND='fd --hidden --follow --type file --type directory'
# ALT-C: cd into the selected directory
export FZF_ALT_C_COMMAND='fd --hidden --follow --type directory'
# vim **<tab> runs _fzf_compgen_path()
_fzf_compgen_path() {
    fd --hidden --follow . "$1"
}
# cd **<tab> runs _fzf_compgen_dir()
_fzf_compgen_dir() {
    fd --hidden --follow --type directory . "$1"
}
# custom fuzzy completion(experimental) for j
_fzf_complete_j() {
    _fzf_complete --reverse -- "$@" < <(
        fd --hidden --follow --type directory
    )
}
# default options for all fzf command and key bindings
export FZF_DEFAULT_OPTS='--layout=reverse --info=inline --height=50% --multi'

# enable https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# try to find suggestion from the completion(based on what
# tab-completion suggest) engine if can't match history before
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# enalbe https://github.com/zsh-users/zsh-syntax-highlighting
# zsh-syntax-highlighting must be the last plugin sourced
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[path]=none           # no underline under path
ZSH_HIGHLIGHT_STYLES[path_prefix]=none    # no underline under path prefix
