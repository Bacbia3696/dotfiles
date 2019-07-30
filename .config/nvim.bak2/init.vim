" Nguyen Thanh Dat, 30/Jul/2019
" Credit from VimBootstrap, SpaceVim, dougblack vimrc
" =============================

" PLUG IN {{{
call plug#begin('~/.vim/plugged')

" General
Plug 'dense-analysis/ale' " Asynchronous Lint Engine 
Plug 'tpope/vim-surround' " Surround stuffs
Plug 'tpope/vim-repeat' " Repeat unnative command
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'Shougo/deoplete.nvim' " Dark powered asynchronous completion framework
Plug 'Shougo/denite.nvim' "Dark powered asynchronous unite all interfaces
Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair

" Python
Plug 'deoplete-plugins/deoplete-jedi' " Deoplete.nvim source for Python

call plug#end()
" }}}
" =============================
" CUSTOM KEYBIND {{{

" Save and quit
nnoremap <C-q> :quit!<CR>
nnoremap <C-s> :save %<CR>
inoremap <C-q> <ESC>:quit!<CR>
inoremap <C-s> <ESC>:save %<CR>

" move visually
nnoremap j gj
nnoremap k gk
nnoremap ^ g^
nnoremap $ g$
nnoremap 0 g0
nnoremap gj j
nnoremap gk k
nnoremap g^ ^
nnoremap g0 0

" Navigate windows
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-h> :wincmd h<CR>

" Navigate tabs
nnoremap <S-T> :$tabnew<CR>
nnoremap <M-1> 1gt
nnoremap <M-2> 2gt
nnoremap <M-3> 3gt
nnoremap <M-4> 4gt
nnoremap <M-5> 5gt
nnoremap <M-6> 6gt
nnoremap <M-7> 7gt
nnoremap <M-8> 8gt
nnoremap <M-9> 9gt
inoremap <M-0> :tablast<CR>
inoremap <M-1> <ESC>1gt
inoremap <M-2> <ESC>2gt
inoremap <M-3> <ESC>3gt
inoremap <M-4> <ESC>4gt
inoremap <M-5> <ESC>5gt
inoremap <M-6> <ESC>6gt
inoremap <M-7> <ESC>7gt
inoremap <M-8> <ESC>8gt
inoremap <M-9> <ESC>9gt
inoremap <M-0> <ESC>:tablast<CR>

" Fix upercase in command mode
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

" }}}
" =============================
" LEADER KEYBINDING {{{

" Pick leader key
let mapleader="\<Space>"

" high light last past
nnoremap <leader>p `[v`]
" select all buffer
nnoremap <leader>a ggVG
" edit in current file path
nnoremap <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" tab edit in current file path
nnoremap <leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" edit config file
nnoremap <leader>e :vs $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>
" toggle fold
nnoremap <leader><leader> za

" }}}
" =============================
" THEME AND DISPLAY {{{
" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
" ↵,→,~,↷,↶,·,¬,⇨,⋄
set listchars=eol:¬,tab:⇨\ ,trail:⋄,space:·
set list
colorscheme slate
set termguicolors " use terminal gui color as background

" }}}
" =============================
" CHANGE DEFAULT BEHAVIOR {{{

set number relativenumber " show relative number
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable autocomment the next line
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4    " number of space move for 1 shift
set expandtab       " tabs are spaces
set wrap linebreak  " make break line
set clipboard=unnamed,unnamedplus " use main clipboard
set ignorecase smartcase " use smart case
let g:python3_host_prog="/home/dreamer/.pyenv/nvim/bin/python3" " set default python path
" Remove delay time when switch to normal mode
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0
" Open new buffer in left, and bellow
set splitright
set splitbelow
" Increase history in vim, default is 20
set history=1000
" Persistent undo
" https://stackoverflow.com/questions/5700389/using-vims-persistent-undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
" Folding
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
set foldlevelstart=10   " start with fold level of 10

" }}}
" =============================
" CUSTOM FUNCTION {{{
" }}}
" =============================
" AUTO GROUPS {{{
" }}}
" =============================
" PLUGIN CONFIGURATION {{{

" Deoplete {{{
let g:deoplete#enable_at_startup = 1 " Enable by default
" }}}

" }}}
" =============================
" Define mappings
autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <Space>
  \ denite#do_map('toggle_select').'j'
endfunction
" set modelines=1
" vim:foldmethod=marker:foldlevel=0
