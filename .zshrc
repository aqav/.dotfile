HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
setopt notify
setopt prompt_subst
unsetopt nomatch
unsetopt beep

bindkey -e

zstyle :compinstall filename '/home/y/.zshrc'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.dotfile/.sh ] && source ~/.dotfile/.sh

source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit load zsh-users/zsh-autosuggestions
zinit load zsh-users/zsh-syntax-highlighting

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

zstyle ':completion:*' special-dirs true
_comp_options+=(globdots)

eval "$(dircolors)"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
