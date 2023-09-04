#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
export PATH=$HOME/.local/bin:$HOME/.cargo/bin:$PATH
export PATH=$HOME/.dotnet/tools:$PATH
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$HOME/.dotnet:$PATH

