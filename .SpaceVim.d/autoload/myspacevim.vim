

  " unbind jk
  iu jk

  " use <C-k> and <C-j> to move up and down
  inoremap <C-k> <C-p>
  inoremap <C-j> <C-n>
  cnoremap <C-k> <C-p>
  cnoremap <C-j> <C-n>

  " faster navigation window vim
  nnoremap <C-k>   :wincmd k<CR>
  nnoremap <C-j>   :wincmd j<CR>
  nnoremap <C-h>   :wincmd h<CR>
  nnoremap <C-l>   :wincmd l<CR>
  nnoremap <S-t>   :$tabnew<CR>
  nnoremap <Tab>   :wincmd w<CR>
  nnoremap <S-tab> :wincmd W<CR>

  "        use    <C-q>        to close quickly and <C-s> to save even in insert mode
  inoremap <C-q>  <Esc>:q!<CR>
  noremap  <C-q>  :q!<CR>
  inoremap <C-s> <Esc>:w<CR>
  nnoremap <C-s> :w<CR>

  " open new buffer in left, and bellow
  set splitright
  set splitbelow

  " config for word motion
  nmap dw de
  nmap cw ce

  " faster move from insert mode to normal mode
  set timeoutlen=1000 ttimeoutlen=0

  " config for python
  let g:python3_host_prog      = "/home/dreamer/.pyenv/nvim/bin/python"
  let g:loaded_python_provider = 1

  " config for auto pair
  au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
  au FileType html*    let b:AutoPairs = AutoPairsDefine({'{%' : '%}', '<!--' : '-->'})
  au FileType *js*     let b:AutoPairs = AutoPairsDefine({'{/*' : '*/}'})

  " disable auto comment
  au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " softwrap
  set wrap linebreak

  " move visually
  nnoremap j gj
  nnoremap k gk
  nnoremap ^ g^
  nnoremap $ g$

  " navigation tab by alt + number
  nmap <M-1> <leader>1
  nmap <M-2> <leader>2
  nmap <M-3> <leader>3
  nmap <M-4> <leader>4
  nmap <M-5> <leader>5
  nmap <M-6> <leader>6
  nmap <M-7> <leader>7
  nmap <M-8> <leader>8
  nmap <M-9> <leader>9
  nmap <M-0> <space>as
  imap <M-1> <Esc><leader>1
  imap <M-2> <Esc><leader>2
  imap <M-3> <Esc><leader>3
  imap <M-4> <Esc><leader>4
  imap <M-5> <Esc><leader>5
  imap <M-6> <Esc><leader>6
  imap <M-7> <Esc><leader>7
  imap <M-8> <Esc><leader>8
  imap <M-9> <Esc><leader>9
  imap <M-0> <Esc><space>as

  " config for css3 syntax plugin
  augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
  augroup END

  " confix for auto format
  noremap <F5> :Autoformat<CR>

  " config for emmet
  autocmd FileType html*,css EmmetInstall

  "" Set working directory
  nnoremap <leader>. :lcd %:p:h<CR>

  "" Opens an edit command with the path of the currently edited file filled in
  noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

  "" Opens a tab edit command with the path of the currently edited file filled
  noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

  "" no one is really happy until you have this shortcuts
  cnoreabbrev W! w!
  cnoreabbrev Q! q!
  cnoreabbrev Qall! qall!
  cnoreabbrev Wq wq
  cnoreabbrev Wa wa
  cnoreabbrev wQ wq
  cnoreabbrev WQ wq
  cnoreabbrev W w
  cnoreabbrev Q q
  cnoreabbrev Qall qall

  " enable per project config
  set exrc
  set secure

  " show command please
  set showcmd

  " Leader a to select all buffer
  nnoremap <leader>a ggVG

  " Insert semicolon at the end of line
  inoremap <leader>; <ESC>A;<CR>

  " Delete text in vim

  nnoremap <leader>d "_d
  xnoremap <leader>d "_d

  " Enable SUPER HARDCORE VIM
  let g:hardtime_default_on = 1
  let g:hardtime_showmsg = 1
  let g:hardtime_maxcount = 40

  " Display all white space character
  " https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
  " set listchars=eol:¬,tab:→\ ,trail:~,extends:↷,precedes:↶,space:·
  set listchars=eol:↵,tab:⇨\ ,trail:⋄,extends:↷,precedes:↶,space:·
  set list

  " Add custom space key binding
  call SpaceVim#custom#SPCGroupName(['G'], '+TestGroup')
  call SpaceVim#custom#SPC('nore', ['G', 't'], 'echom 1', 'echomessage 1', 1)

  " " Make display menu wide
  " set wildmenu
  " set wildmode=list:longest,full

  " Fix FZF layer, ControlP do not receive hotkey
  command! FzfFiles call <SID>files()
  function! s:files() abort
    let s:source = 'files'
    call fzf#run(fzf#wrap('files', {'options': '--reverse', 'down' : '40%'}))
  endfunction

  " Bind F to fucus mode
  nmap <M-f> <Space>wc

  " This is for convenience search
  set ignorecase
  set smartcase

  " Toggle undotree
  nnoremap <F6> :UndotreeToggle<cr>

  " Visual select last pasted
  nnoremap <leader>p `[v`]

  " Replace text in visual mode, this is actually the hardest keybinding :)))
  " vnoremap p <ESC>Go<ESC>gv"_dP`[v`]<ESC>G"_ddgv<ESC>^
  " vnoremap p "0p

  " Use os buffer
  set clipboard=unnamed,unnamedplus

endfunction

function! myspacevim#after() abort

  " Set transparent
  command Transparent hi Normal guibg=NONE ctermbg=NONE | hi EndOfBuffer guibg=NONE ctermbg=NONE | hi LineNr guibg=NONE ctermbg=NONE

  " fix commend for special filetype
  au FileType javascript.jsx setlocal commentstring=\{/\*\ %s\ \*/\}
  au FileType htmldjango setlocal commentstring=\{#\ %s\ #\}

endfunction
