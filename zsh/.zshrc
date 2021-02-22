#            _
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__
# (_)___|___/_| |_|_|  \___|

# run tmux if started from iTerm2
[ $TERM_PROGRAM = "iTerm.app" ] && [ -z $TMUX ] && exec tmux -f $HOME/.config/tmux/tmux.conf new-session -A -s main

# install zgen if not exists and load command
[ -d "${HOME}/.config/zgen" ] || git clone https://github.com/tarjoilija/zgen.git "${HOME}/.config/zgen"
source "${HOME}/.config/zgen/zgen.zsh"

# if the init script doesn't exist
if ! zgen saved; then
	# fancy prompt
	zgen load AnH0ang/spaceship-prompt spaceship

	# # specify plugins here
	zgen load urbainvaes/fzf-marks
	zgen load kutsan/zsh-system-clipboard
	zgen load AnH0ang/zsh-vim-mode
	zgen load zsh-users/zsh-completions
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-autosuggestions
	zgen load esc/conda-zsh-completion

	# # generate the init script from plugins above
	zgen save
fi

bindkey -s '^f' 'fcd ~\n'
bindkey '^g' fzm
bindkey '^e' edit-command-line
bindkey -s '^l' 'lfcd\n'
bindkey '^ ' autosuggest-accept

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/fzf/commands.sh" ] && source "$HOME/.config/fzf/commands.sh"

# load lf config
[ -f  "${HOME}/.config/lf/lf.config.sh" ] && source "${HOME}/.config/lf/lf.config.sh"

# load spaceship config
[ -f  "${HOME}/.config/spaceship/config.sh" ] && source "${HOME}/.config/spaceship/config.sh"

# command -v direnv &>/dev/null && eval "$(direnv hook zsh)" || echo "direnv not found."

# # >>> conda initialize >>>
# # !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/anhoang/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/anhoang/anaconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/anhoang/anaconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/anhoang/anaconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# # <<< conda initialize <<<
