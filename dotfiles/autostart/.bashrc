#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
# Apply pywal colors if available
if [ -f ~/.cache/wal/colors.sh ]; then
    source ~/.cache/wal/colors.sh
fi

# Created by `pipx` on 2024-08-24 07:59:21
export PATH="$PATH:/home/JellyBean/.local/bin"
