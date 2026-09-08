# Modded-ubuntu-termux Bash configuration

export EDITOR=vim
export VISUAL=vim

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cls='clear'

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi
