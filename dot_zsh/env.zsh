###########
## Shell ##
###########
export EDITOR=code
export VISUAL=code

export STARSHIP_CONFIG=~/.zsh/starship.toml
export SPACESHIP_USER_SHOW="always"
export SPACESHIP_HOST_SHOW="always"

# Set your language environment
export LANG=en_US.UTF-8

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--layout=reverse --inline-info'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


export NODE_OPTIONS="--no-deprecation"
###############
## Languages ##
###############

#############
## Plugins ##
#############

# configure zsh-autosuggestions
export FZF_DEFAULT_COMMAND="fd --one-file-system --type f --hidden . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --one-file-system --type d --hidden --exclude .git . $HOME"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=242,bg=grey,bold,underline"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion) 


#############
## gpg-agent ##
#############
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh

#############
## nnn ##
#############
export NNN_FIFO=/tmp/nnn.fifo
export NNN_PLUG='p:preview-tui;f:finder;d:fzcd;'

#############
## Volta ##
#############
export VOLTA_HOME=~/.volta
