" Vim Plug {{{
call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'sjl/badwolf'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'xuhdev/vim-latex-live-preview' , { 'for': 'tex' }
Plug 'sjl/gundo.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'deoplete-plugins/deoplete-clang'
Plug 'mattn/emmet-vim'
Plug '/usr/share/fzf'
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'Chiel92/vim-autoformat'
Plug 'suan/vim-instant-markdown'
Plug 'ap/vim-css-color'
Plug 'Yggdroot/indentLine'
call plug#end()
" }}}
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
    autocmd BufEnter *.js* setlocal tabstop=2
    autocmd BufEnter *.js* setlocal shiftwidth=2
    autocmd BufEnter *.html* setlocal tabstop=2
    autocmd BufEnter *.html* setlocal shiftwidth=2
    autocmd TermOpen * setlocal statusline=%{b:term_title}
    autocmd SwapExists * let v:swapchoice = "o"
    au filetype markdown set conceallevel=0
augroup END
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
" Colors {{{
syntax enable           " enable syntax processing
colorscheme badwolf
" }}}
" Leader Shortcuts {{{
let mapleader=","
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>t :TerminalToggle<CR>
" nnoremap <leader>l :LLPStartPreview<CR>
nnoremap <leader>a :Ag 
nnoremap <leader>c :SyntasticCheck<CR>:Errors<CR>
nnoremap <leader>m A
inoremap <leader>m <C-o>A
nmap <Leader>l <C-w>w
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
nnoremap <silent> <A-f> :ZoomToggle<CR>

function! s:TerminalToggle() abort
    if 0
        echom "Not implement yet"
    else
        setlocal splitbelow
        10new
        terminal
        normal i
        let t:terminal = 1
    endif
endfunction
command! TerminalToggle call s:TerminalToggle()
" }}}
" Switching between tabs quit & save{{{
	tnoremap <A-1> <C-\><C-N>1gt
	tnoremap <A-2> <C-\><C-N>2gt
	tnoremap <A-3> <C-\><C-N>3gt
	tnoremap <A-4> <C-\><C-N>4gt
	tnoremap <A-5> <C-\><C-N>5gt
	tnoremap <A-6> <C-\><C-N>6gt
	tnoremap <A-7> <C-\><C-N>7gt
	tnoremap <A-8> <C-\><C-N>8gt
	tnoremap <A-9> <C-\><C-N>9gt
	nnoremap <A-1> 1gt
	nnoremap <A-2> 2gt
	nnoremap <A-3> 3gt
	nnoremap <A-4> 4gt
	nnoremap <A-5> 5gt
	nnoremap <A-6> 6gt
	nnoremap <A-7> 7gt
	nnoremap <A-8> 8gt
	nnoremap <A-9> 9gt
    nnoremap <A-pageDown> :tabn<cr>
    nnoremap <A-pageUp> :tabp<cr>
    tnoremap <A-pageUp> <C-\><C-N><C-pageUp>
    tnoremap <A-pageDown> <C-\><C-N><C-pageDown>
    tnoremap <C-pageUp> <C-\><C-N><C-pageUp>
    tnoremap <C-pageDown> <C-\><C-N><C-pageDown>
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
    inoremap <A-h> <C-\><C-N><C-w>h
    inoremap <A-j> <C-\><C-N><C-w>j
    inoremap <A-k> <C-\><C-N><C-w>k
    inoremap <A-l> <C-\><C-N><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
    nnoremap <C-W><C-T> :tabnew<cr>
    nnoremap <C-W>T :tabnew<cr>
    inoremap <C-q> <Esc>:q!<cr>
    nnoremap <C-q> :q!<cr>
    inoremap <C-s> <Esc>:w<cr>
    nnoremap <C-s> :w<cr>
    inoremap <M-q> <Esc>:qa!<cr>
    nnoremap <M-q> :qa!<cr>
    inoremap <M-s> <Esc>:wa<cr>
    nnoremap <M-s> :wa<cr>
"}}}
" More config for plugin
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
" " for better indentation
" vnoremap < <gv " better indentation
" vnoremap > >gv " better indentation
set relativenumber
" Config for latex preview
set updatetime=1000
let g:livepreview_previewer = 'zathura'
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<TAB>"
" For deoplete.vim
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
set completeopt-=preview " disable the preview window
" config for jedi
let g:python_host_prog = '/home/dreamer/.pyenv/lab/bin/python'
let g:python3_host_prog = '/home/dreamer/.pyenv/lab/bin/python3'
let g:jedi#completions_enabled = 0
" disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" disable Ex mode
:map Q <Nop>
" paste from system clipboard
vnoremap <C-c> "+y
" enable mouse support
set mouse=a
" EMMET vim config
let g:user_emmet_leader_key=','
" auto pair set up
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
au FileType html*     let b:AutoPairs = AutoPairsDefine({'{%' : '%}', '<!--' : '-->'})
au FileType *js*     let b:AutoPairs = AutoPairsDefine({'{/*' : '*/}', '<' : ' />'})
au BufRead /tmp/psql.edit.* set syntax=sql
" Auto format
noremap <F3> :Autoformat<CR>
" FZF
nmap <C-p> :Files<cr>
" Remap terminal exit
tnoremap <C-q> <C-\><C-n>
" Go to new line
inoremap <M-CR> <ESC>o
" Config for vim-commentary
autocmd FileType javascript.jsx setlocal commentstring=\{/\*\ %s\ \*/\}
" for vim indent
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-s>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" vim:foldmethod=marker:foldlevel=0
