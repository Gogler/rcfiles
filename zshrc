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
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.5/site-packages/:~/.local/lib/python3.5/site-packages
export XDG_CONFIG_HOME=~/.config/

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#--------------------------- Powerline Statuslien
. $POWERLINE_ROOT/bindings/zsh/powerline.zsh
#--------------------------- Powerline Statuslien
#setxkbmap -option caps:swapescape
#--------------------------- Base16 Shell
BASE16_SHELL="~/.config/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL



if [ -f "~/.alias_export" ]; then
    . ~/.alias_export
fi
#===========CUSTOM EXPORTS
export QTCHOOSER_RUNTOOL=qtconfig
export QT_SELECT=5
export POWERLINE_ROOT="~/.local/lib/python3.5/site-packages/powerline"
alias pdf='zathura'
alias mplayer='mplayer -vsync'
alias vim='nvim'
alias pacman="sudo pacman"
alias aura="sudo aura"
alias cdpowerline="cd $POWERLINE_ROOT"
#--------------------------- Aura sudo for build
function a(){
AURA="$(aura "$@")"
if echo "$AURA" | grep -q '^aura >>= .*You have to use `.*sudo.*` for that.*$'
then
    sudo aura "$@"
else
    echo "$AURA"
fi
}
