export PROMPT_EOL_MARK='󰌑'
export XDG_CONFIG_HOME="$HOME/.config"

# FZF style
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --layout default
  --header 'Press CTRL-Y to copy command into clipboard'"
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
export FZF_DEFAULT_OPTS="--reverse --height 60% --cycle --border \
  --color='info:cyan,border:magenta,gutter:-1'"

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

# DOCKER
# export DOCKER_BUILDKIT=1
# export COMPOSE_DOCKER_CLI_BUILD=1
# export DOCKER_DEFAULT_PLATFORM=linux/amd64
