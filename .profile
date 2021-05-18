#                         __ _ _      
#    _____ __  _ __ ___  / _(_) | ___ 
#   |_  / '_ \| '__/ _ \| |_| | |/ _ \
#  _ / /| |_) | | | (_) |  _| | |  __/
# (_)___| .__/|_|  \___/|_| |_|_|\___|
#       |_|                           
# Profile file. Runs on login. Environmental variables are set here.

export LC_ALL="en_US.UTF-8"

# ~/ Clean-up:
export LESSHISTFILE="-"
export ZDOTDIR="$HOME/.config/zsh"
export ZPLUG_HOME="$HOME/.config/zplug"
export ZGEN_DIR="$HOME/.config/zgen/plugins"
export INPUTRC="$HOME/.config/inputrc"


# Default programms
export EDITOR="nvim"
export FILE="lf"
export GIT_EDITOR="nvim"

# FZF defaults
export FZF_DEFAULT_OPTS="--layout=reverse --height 40%"
export FZF_DEFAULT_COMMAND='ag -f --hidden --ignore .git -g ""'

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

export CDPATH="$CDPATH:$(eval echo ~$USER)"

# When havin $PATH problems goto: https://pgib.me//blog/2013/10/11/macosx-tmux-zsh-rbenv/
# export PATH=$HOME/anaconda3/bin:$PATH
