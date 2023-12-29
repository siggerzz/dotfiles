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
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias ping='ping -c 5'
alias speed='speedtest-cli --single'
alias ipe='curl ipinfo.io/ip'
alias ports='netstat -tulanp'
alias rm='rm -i' # confirm removal
alias cp='cp -i' # confirm copy
alias mv='mv -i' # confirm move
alias cal='gcal --starting-day=1' # print simple calendar for current month
alias weather='curl v2.wttr.in' # print weather for current location (https://github.com/chubin/wttr.in)
