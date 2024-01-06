export PROMPT_EOL_MARK='󰌑'
export XDG_CONFIG_HOME="$HOME/.config"

# LESS flags
export LESS='-SRXF'

# default editor is neovim
export VISUAL=nvim
export EDITOR=$VISUAL

# golang env
export PATH="$HOME/.local/bin:$HOME/go/bin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"
# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && \
    source "$HOME/.gvm/scripts/gvm"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

#pyenv
export PATH="$HOME/.pyenv/bin:$HOME/.pyenv/shims:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

source <(kubectl completion zsh) # setup autocomplete in zsh into the current shell

# nvm
source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/datnt/.local/share/pnpm"
case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


# cargo
export PATH="$HOME/.cargo/bin:$PATH"

# DOCKER
# export DOCKER_BUILDKIT=1
# export COMPOSE_DOCKER_CLI_BUILD=1
# export DOCKER_DEFAULT_PLATFORM=linux/amd64


#### Image ####
#Display specs
#neofetch
#Display Pokemon
#pokemon-colorscripts --no-title -r 1,3,6
#Display random gifs
[[ -z "$NVIM" ]] && kitten icat --align left "$(find $HOME/.config/neofetch/gifs/ -name '*.gif' | sort -R | head -1)"
