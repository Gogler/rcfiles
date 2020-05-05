[[ $- != *i* ]] && return

complete -cf sudo
complete -cf man

export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]\[\033[38;5;15m\]@\h:\[$(tput sgr0)\]\[\033[38;5;6m\][\w]:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"
unset PROMPT_COMMAND

if [ -f ~/.alias_export ]; then
    . ~/.alias_export
fi
