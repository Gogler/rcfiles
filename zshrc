# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

zstyle :compinstall filename '/home/adi/.zshrc'
HISTFILE=~/.zsh_histfile
HISTSIZE=2000
SAVEHIST=2000

setopt APPEND_HISTORY
autoload -Uz compinit
compinit
# End of lines added by compinstall

#--------------------------- EXPORTS
export POWERLINE_ROOT="/home/adi/.local/lib/python3.5/site-packages/powerline"
export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.5/site-packages/:~/.local/lib/python3.5/site-packages
export XDG_CONFIG_HOME=~/.config/

#--------------------------- Archy Status Line
if [ -f "~/alias" ]; then
    . ~/alias
fi
alias pdf='zathura'
alias mplayer='mplayer -vsync'
alias vim='nvim'
alias pacman="sudo pacman"
alias aura="sudo aura"
alias cdpowerline="cd $POWERLINE_ROOT"

#--------------------------- Powerline Statuslien
. $POWERLINE_ROOT/bindings/zsh/powerline.zsh
#--------------------------- Powerline Statuslien
#setxkbmap -option caps:swapescape
#--------------------------- Base16 Shell
BASE16_SHELL="/home/adi/.config/base16-shell/base16-monokai.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

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

#===========CUSTOM EXPORTS
export QTCHOOSER_RUNTOOL=qtconfig
export QT_SELECT=5


if [ -f "~/alias_export" ]; then
    . ~/alias
fi
