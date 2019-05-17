" Spaces & Tabs {{{
set tabstop=4           " 4 space tab
set expandtab           " use spaces for tabs
set softtabstop=4       " 4 space tab
set shiftwidth=4
set modelines=1
filetype indent on
filetype plugin on
set autoindent
" }}}
" UI Layout {{{
set number              " show line numbers
set showcmd             " show command in bottom bar
set nocursorline        " highlight current line
set wildmenu
set lazyredraw
set showmatch           " higlight matching parenthesis
set fillchars+=vert:┃
" }}}
" Searching {{{
set ignorecase          " ignore case when searching
set incsearch           " search as characters are entered
set hlsearch            " highlight all matches
" }}}
" Folding {{{
"=== folding ===
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap <space> za
set foldlevelstart=10   " start with fold level of 1
" }}}
" Line Shortcuts {{{
nnoremap j gj
nnoremap k gk
nnoremap gV `[v`]
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>t :NERDTreeToggle<CR>
nnoremap <leader>l :LLPStartPreview<CR>
nnoremap <leader>m :set filetype?<CR>
nnoremap <leader>w :w !sudo tee %<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>1 :set number!<CR>
nnoremap <leader>d :GoDoc 
" }}}
" Syntastic {{{
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_ignore_files = ['.java$']
let g:syntastic_python_python_exec = 'python3'
" }}}
" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufEnter *.tex setlocal filetype=tex
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
    autocmd BufEnter *.py setlocal tabstop=4
    autocmd BufEnter *.md setlocal ft=markdown
    autocmd BufEnter *.go setlocal noexpandtab
    autocmd BufEnter *.avsc setlocal ft=json
augroup END
" }}}
" Testing {{{
let test#strategy = 'neovim'
let test#python#runner = 'nose'
" }}}
" Backups and undo{{{
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
set undodir=~/.vim/tmp/undo//
set undofile
set history=100
set undolevels=100
" }}}
" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'xuhdev/vim-latex-live-preview' , { 'for': 'tex' }
Plug 'tpope/vim-surround'
Plug 'sjl/gundo.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'yggdroot/indentline'
Plug 'mattn/emmet-vim'
Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
call plug#end()
" }}}
" Colors {{{
syntax enable           " enable syntax processing
colorscheme badwolf
" }}}
" Custom Functions {{{
" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> <C-w>z :ZoomToggle<CR>
" }}}
" More config for plugin
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" for better indentation
vnoremap < <gv " better indentation
vnoremap > >gv " better indentation
set relativenumber
" Config for latex preview
set updatetime=1000
let g:livepreview_previewer = 'zathura'
" For deoplete.vim
let g:deoplete#enable_at_startup = 1
"Tab to completion
"" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" config for jedi
let g:python_host_prog = '/home/dreamer/.pyenv/lab/bin/python'
let g:python3_host_prog = '/home/dreamer/.pyenv/lab/bin/python3'
" Add hot key to move tab
map <C-w><pageDown> :tabn<cr>
map <C-w><pageUp> :tabp<cr>
" Quit and save
inoremap <C-q> <Esc>:q!<cr>
nnoremap <C-q> :q!<cr>
inoremap <C-s> <Esc>:w<cr>
nnoremap <C-s> :w<cr>
" disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" disable Ex mode
:map Q <Nop>
" paste from system clipboard
" noremap <C-v> "+]p:set nopaste<CR> 
vnoremap <C-c> "+y
" enable mouse support
set mouse=a
" EMMET vim config
let g:user_emmet_leader_key=','
" auto pair set up
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
au FileType html     let b:AutoPairs = AutoPairsDefine({'{%' : '%}', '<!--' : '-->'})

" vim:foldmethod=marker:foldlevel=0
