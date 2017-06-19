# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

zstyle :compinstall filename '~/.zshrc'
HISTFILE=~/.zsh_histfile
HISTSIZE=2000
SAVEHIST=2000

setopt APPEND_HISTORY
autoload -Uz compinit
compinit
# End of lines added by compinstall

#--------------------------- EXPORTS
if [ -f ~/.alias_export ]; then
    . ~/.alias_export
fi

#--------------------------- Powerline Statuslien
powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
. $POWERLINE_ROOT/bindings/zsh/powerline.zsh
alias cdpowerline="cd $POWERLINE_ROOT"

#--------------------------- Base16 Shell
BASE16_SHELL=~/.local/base16-shell/scripts/base16-monokai.sh
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

#===========CUSTOM EXPORTS
#setxkbmap -option caps:swapescape
export QTCHOOSER_RUNTOOL=qtconfig
export QT_SELECT=5
alias vim='nvim'
bindkey -e
