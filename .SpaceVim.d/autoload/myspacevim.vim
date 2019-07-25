function! myspacevim#before() abort

  " unbind jk
  iu jk

  " use <C-k> and <C-j> to move up and down
  inoremap <C-k> <C-p>
  inoremap <C-j> <C-n>

  " faster navigation window vim
  nnoremap <C-k> <C-w>k
  nnoremap <C-j> <C-w>j
  nnoremap <C-l> <C-w>l
  nnoremap <C-h> <C-w>h

  " use leader m instead of m for mark position
  nnoremap <silent><Leader>m m

  " use <C-q> to close quickly and <C-s> to save even in insert mode
  inoremap <C-q> <Esc>:q!<CR>
  inoremap <C-s> <Esc>:w<CR>
  noremap <C-q> :q!<CR>

  " use os clipboard
  set clipboard=unnamedplus

  " open new buffer in left, and bellow
  set splitright
  set splitbelow

  " config for word motion
  nmap dw de
  nmap cw ce

  " faster move from insert mode to normal mode
  set timeoutlen=1000 ttimeoutlen=0

  " fix commend for special filetype
  au FileType javascript.jsx setlocal commentstring=\{/\*\ %s\ \*/\}
  au FileType htmldjango setlocal commentstring=\{#\ %s\ #\}

  " config for python
  let g:python3_host_prog = "/home/dreamer/.pyenv/nvim/bin/python"
  let g:loaded_python_provider = 1

  " config for auto pair
  au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
  au FileType html*    let b:AutoPairs = AutoPairsDefine({'{%' : '%}', '<!--' : '-->'})
  au FileType *js*     let b:AutoPairs = AutoPairsDefine({'{/*' : '*/}', '<' : ' />'})

  " disable auto comment
  au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  " softwrap 
  set wrap linebreak nolist

  " move visually
  nnoremap j gj
  nnoremap k gk
  nnoremap ^ g^
  nnoremap $ g$

  " navigation tab by alt + number
  nnoremap <M-1> 1gt
  nnoremap <M-2> 2gt
  nnoremap <M-3> 3gt
  nnoremap <M-4> 4gt
  nnoremap <M-5> 5gt
  nnoremap <M-6> 6gt
  nnoremap <M-7> 7gt
  nnoremap <M-8> 8gt
  nnoremap <M-9> 9gt
  nnoremap <M-0> tablast
  inoremap <M-1> 1gt
  inoremap <M-2> 2gt
  inoremap <M-3> 3gt
  inoremap <M-4> 4gt
  inoremap <M-5> 5gt
  inoremap <M-6> 6gt
  inoremap <M-7> 7gt
  inoremap <M-8> 8gt
  inoremap <M-9> 9gt
  inoremap <M-0> tablast

  " config for css3 syntax plugin
  augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  augroup END

  set term=screen-256color

endfunction

function! myspacevim#after() abort


endfunction
