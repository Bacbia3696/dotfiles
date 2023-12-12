export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

export FZF_CTRL_R_OPTS="
--preview 'echo {}'
--bind 'ctrl-/:change-preview-window(right|hidden|)'
--preview-window 'wrap:bottom:30%'
--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
"

export FZF_CTRL_T_OPTS="
--preview='
file --mime-type {} | grep -qF image/ &&
kitty icat --clear --transfer-mode=memory --stdin=no --place=\${FZF_PREVIEW_COLUMNS}x\${FZF_PREVIEW_LINES}@0x0 {} ||
bat --color=always {}'
"

export FZF_ALT_C_OPTS="
--preview 'tree -C {}'
--header 'List directory'
"

export FZF_DEFAULT_OPTS="--reverse --height 60% --cycle --border
--bind 'ctrl-u:preview-page-up'
--bind 'ctrl-d:preview-page-down'
--bind 'ctrl-/:change-preview-window(down|hidden|)'
--bind 'ctrl-y:execute-silent(echo -n {} | wl-copy)+abort'
--bind 'ctrl-g:top'
--header 'keys: <C-g>,<C-/>,<C-u>,<C-d>,<C-y>'
--scroll-off 1
--prompt '󰦨 '
--pointer ''
--marker ''
--preview-window 'wrap:60%'
--color 'border:#589ed7,gutter:-1,fg+:#4fd6be,bg+:#273644'
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
enable-fzf-tab

# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with tree or file with bat
zstyle ':fzf-tab:complete:(nvim|cp|mv|cd):*' fzf-preview '([[ -d $realpath ]] && tree -C $realpath) || bat $realpath --color always'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-min-height 20

function rfv() {
  rg --color=always --line-number --no-heading --smart-case "${*:-}" |
    fzf --ansi \
      --color "hl:-1:underline,hl+:-1:underline:reverse" \
      --delimiter : \
      --preview 'bat --color=always {1} --highlight-line {2}' \
      --preview-window 'up,60%,border-bottom,+{2}+3/3,~3' \
      --bind 'enter:become(nvim {1} +{2})'
}

