# The following lines were added by compinstall
#
# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
    eval "$("$BASE16_SHELL/profile_helper.sh")"

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

powerline-daemon -q
. /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
