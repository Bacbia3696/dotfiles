# Enviroment varible
export kvm="192.168.122"
export lxcvm="10.108.10"
export MYPYTHON="~/.pyenv/lab/bin/python"

# Aliash
alias q=exit
alias a="pipenv shell"
alias vim=nvim
alias o=xdg-open
alias r=ranger
alias t=tmux
alias wd="writediary"
alias rd="r ~/playGround/.diary"
alias rdd="vim $HOME/playGround/.diary/`date -d yesterday +%F`.tex"
alias ipy="chenv lab && ipython --profile=lab --matplotlib"
alias jl="bash -c \"source ~/.pyenv/lab/bin/activate && jupyter lab 1>/dev/null 2>&1 &\"" 
alias o="xdg-open"
alias m="ncmpcpp --screen=visualizer"
alias e=vim
alias se=sudoedit
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias image='xclip -sel clip -t image/png -o > '

export server="13.76.83.15"

PATH=$PATH:$HOME/.local/bin

# Shortcut
# Function
function backup() {
    cp $1 $1.`date +%F`
}

function chenv() {
    if [ "$#" -eq 0 ]
    then
        deactivate
    else
        source ~/.pyenv/$1/bin/activate
    fi
}

function writediary() {
    cd $HOME/playGround/.diary
    filename=`date +%F`.tex
    if [ ! -f $filename ]; then
        echo "New file created"
        cp template.tex $filename
    fi
    echo $filename
    vim $filename
    cd -
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
