# Package management
alias update="sudo pacman -Syu && yaourt -Syu --aur"
alias install="sudo pacman -S"
alias remove="sudo pacman -R"
alias search="sudo pacman -Q"

alias ll='ls -al'
alias lsd='CLICOLOR_FORCE=1 ll | grep --color=never "^d"'
# Easier navigation: .., ..., -
alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

# File size
alias fs="stat -f '%z bytes'"
alias df="df -h"
