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

	zgen oh-my-zsh
	zgen oh-my-zsh plugins/docker
	zgen oh-my-zsh plugins/docker-compose
	zgen oh-my-zsh plugins/aws
	zgen oh-my-zsh plugins/ssh-agent
	zgen oh-my-zsh plugins/brew
	zgen oh-my-zsh plugins/git

	# specify plugins here
	zgen load urbainvaes/fzf-marks
	zgen load kutsan/zsh-system-clipboard
	zgen load AnH0ang/zsh-vim-mode
	zgen load zsh-users/zsh-completions
	zgen load zsh-users/zsh-syntax-highlighting
	zgen load zsh-users/zsh-autosuggestions
	zgen load esc/conda-zsh-completion

	# generate the init script from plugins above
	zgen save
fi

bindkey -s '^f' 'fcd ~\n'
bindkey '^g' fzm
bindkey '^e' edit-command-line
bindkey -s '^l' 'lfcd\n'
bindkey '^ ' autosuggest-accept

# azure completion
autoload -U +X bashcompinit && bashcompinit
[ -f "/usr/local/etc/bash_completion.d/az" ] && source /usr/local/etc/bash_completion.d/az

# Load aliases and shortcuts if existent.
[ -f "$HOME/.config/shortcutrc" ] && source "$HOME/.config/shortcutrc"
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"
[ -f "$HOME/.config/fzf/commands.sh" ] && source "$HOME/.config/fzf/commands.sh"

# load lf config
[ -f  "${HOME}/.config/lf/lf.config.sh" ] && source "${HOME}/.config/lf/lf.config.sh"

# load spaceship config
[ -f  "${HOME}/.config/spaceship/config.sh" ] && source "${HOME}/.config/spaceship/config.sh"

# poetry zsh completion (check oh-my-zsh plugin in a few months)
mkdir -p $ZDOTDIR/plugins
fpath+=$ZDOTDIR/plugins
type poetry &> /dev/null && ! [ -f $ZDOTDIR/plugins/_poetry ] && ( poetry completions zsh > $ZDOTDIR/plugins/_poetry )

# add direnv hook
command -v direnv &>/dev/null && eval "$(direnv hook zsh)" || echo "direnv not found."

# Enable Makefile target completion
zstyle ':completion:*:make:*:targets' call-command true

# Load pyenv and add link the global environment
eval "$(pyenv init -)"
rm -f "$PYENV_ROOT/global"
ln -s "$PYENV_ROOT/versions/$(pyenv global)" "$PYENV_ROOT/global"
