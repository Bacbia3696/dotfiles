# use bat as man page
export MANPAGER="sh -c 'col -bx | bat -l man -p'" MANROFFOPT="-c"

export BAT_THEME="OneHalfDark"

# https://github.com/sharkdp/bat/issues/2578
export LESSUTFCHARDEF=E000-F8FF:p,F0000-FFFFD:p,100000-10FFFD:p

# colorize help page with bat https://github.com/sharkdp/bat/blob/master/README.md
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'
