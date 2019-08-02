" Pick default theme
colorscheme gruvbox9

" My custom shortcut
nnoremap <C-q> :quit!<CR>
nnoremap <C-s> :save %<CR>
inoremap <C-q> <ESC>:quit!<CR>
inoremap <C-s> <ESC>:save %<CR>

" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
" ↵,→,~,↷,↶,·,¬,⇨,⋄
set listchars=eol:↵,tab:⇨\ ,trail:⋄,space:·
set list

" no one is really happy until you have this shortcuts
" Credit for vim bootstrap
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

" disable auto comment
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" enable per project config
set exrc
set secure

" Disable arrow key
noremap <Up> :echo "Stop it, idiot"<CR>
noremap <Down> :echo "Stop it, idiot"<CR>
noremap <Left> :echo "Stop it, idiot"<CR>
noremap <Right> :echo "Stop it, idiot"<CR>
inoremap <Up> <ESC>:echo "Stop it, idiot"<CR>
inoremap <Down> <ESC>:echo "Stop it, idiot"<CR>
inoremap <Left> <ESC>:echo "Stop it, idiot"<CR>
inoremap <Right> <ESC>:echo "Stop it, idiot"<CR>

" Start startify
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif

" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" edit config file
nnoremap <leader>ve :tabnew /home/dreamer/.thinkvim.d/local_settings.vim<CR>
nnoremap <leader>vs :so /home/dreamer/.thinkvim.d/local_settings.vim<CR>
