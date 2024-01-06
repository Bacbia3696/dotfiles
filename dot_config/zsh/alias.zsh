alias in='sudo pacman -S' # install package
alias un='sudo pacman -Rns' # uninstall package
alias up='sudo pacman -Syu' # update system/package/aur
alias pl='pacman -Qs' # list installed package
alias pa='pacman -Ss' # list availabe package
alias pc='sudo pacman -Sc' # remove unused cache
alias po='pacman -Qtdq | sudo pacman -Rns -' # remove unused packages, also try > pacman -Qqd | pacman -Rsu --print -

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lst='ls --tree'
alias q=exit
alias cl=clear
alias open=xdg-open
alias ssh='TERM=xterm-256color ssh'

alias e="nvim"
alias vim=e

alias k=kubectl
alias c=cargo
alias g=git
alias pn=pnpm
alias px="pnpm dlx"
alias pe="pnpm exec"
alias lg=lazygit
alias t=tmux
alias lc="nvim leetcode.nvim"
alias rg='rg --no-heading'
