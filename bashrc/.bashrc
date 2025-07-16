#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Starship setup
eval "$(starship init bash)"

# Bash auto complete #TODO?
#source ble.sh/out/ble.sh 

# Aliases
alias lyraeng='cd /mnt/data/Dev/Projects/Cpp/OpenGL/LyraEngine'
alias dots='cd ~/Documents/.dotfiles'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

