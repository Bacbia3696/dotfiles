# Enviroment varible
export kvm="192.168.122"
export lxcvm="10.108.10"
export MYPYTHON="~/.pyenv/lab/bin/python"

# Aliash
alias q=exit
alias a="pipenv shell"
alias o=xdg-open
alias r=ranger
alias t=tmux
alias vim=nvim
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
alias et='emacs --terminal /dev/tty1'
alias exat='exa -I="*.pyc" -T --classify'
alias tree='exa -I="*.pyc" -T --classify'


PATH=$PATH:$HOME/.local/bin

# Shortcut
# Function
function backup() {
    cp $1 $1.`date +%F`
}

function pyenv() {
    if [ "$#" -eq 0 ]
    then
        deactivate
    else
        if [ -d "/home/dreamer/.pyenv/$1" ]
        then
            source ~/.pyenv/$1/bin/activate
        else
            echo "Create new env $1"
            (cd ~/.pyenv && python -m venv $1)
            source ~/.pyenv/$1/bin/activate
        fi
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

function runJava() {
    (cd src && javac `echo $1 | sed 's/\./\//g'`.java -d out)
    (cd out && java $1)
}


function code() {
    if [ $# -eq 0 ]
    then
        DIR="."
    else
        DIR=$1
        if [ ! -d $DIR ]
        then
            mkdir -p $DIR
        fi
    fi
    tmux new -s "BACBIA" -n "ide" -c $DIR \; split-window -h -p 20 -d \; attach
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
