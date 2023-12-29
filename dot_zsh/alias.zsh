alias zshreload='source ~/.zshrc'             # reload ZSH
alias c='clear'
alias ls='ls -G'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'
alias dotfiles='cd ~/.local/share/chezmoi'

# Stats
alias shtop='sudo htop'                       # run `htop` with root rights
alias ping='ping -c 5'
alias speed='speedtest-cli --single'
alias ipe='curl ipinfo.io/ip'
alias rm='rm -i' # confirm removal
alias cp='cp -i' # confirm copy
alias mv='mv -i' # confirm move
alias weather='curl v2.wttr.in' # print weather for current location (https://github.com/chubin/wttr.in)
