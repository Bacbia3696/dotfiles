alias in='sudo pacman -S' # install package
alias un='sudo pacman -Rns' # uninstall package
alias up='sudo pacman -Syu' # update system/package/aur
alias pl='pacman -Qs' # list installed package
alias pa='pacman -Ss' # list availabe package
alias pc='sudo pacman -Sc' # remove unused cache
alias po='pacman -Qtdq | sudo pacman -Rns -' # remove unused packages, also try > pacman -Qqd | pacman -Rsu --print -

alias q=exit
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lst='ls --tree'
alias k=kubectl
alias c=cargo
alias g=git
alias p=pnpm
alias px=pnpx
alias e=nvim
alias cl=clear
alias bathelp="bat -p -l help"
alias ssh='TERM=xterm-256color ssh'
alias open=xdg-open
