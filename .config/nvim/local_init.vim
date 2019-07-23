" show relative number is much better
set number relativenumber

" add mouse support
set mouse=a

" https://medium.com/@sidneyliebrand/vim-tip-persistent-undo-2fc78a2973a7
" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.vim/undodir/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
    " finally, enable undo persistence.
    set undofile
endif

" rebind some key
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
noremap <C-q> :q!<CR>
noremap <C-s> :w<CR>
inoremap <C-q> <Esc>:q!<CR>
inoremap <C-s> <Esc>:w<CR>a
nnoremap j gj
nnoremap k gk

" navigation in terminal
tnoremap <C-q> <C-\><C-n>

" change jedi behavior
let g:jedi#popup_select_first = 1
let g:jedi#show_call_signatures = 1

" https://stackoverflow.com/questions/13194428/is-better-way-to-zoom-windows-in-vim-than-zoomwin
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

" disable auto comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" config for easy motion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" do not display colorcolum
autocmd FileType  * setlocal colorcolumn=0

" make super tab move down ward and tab triger jedi
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:jedi#completions_command = "<tab>"
let g:jedi#popup_select_first = 1

" auto pair set up
au FileType php      let b:AutoPairs = AutoPairsDefine({'<?' : '?>', '<?php': '?>'})
au FileType html*    let b:AutoPairs = AutoPairsDefine({'{%' : '%}', '<!--' : '-->'})
au FileType *js*     let b:AutoPairs = AutoPairsDefine({'{/*' : '*/}', '<' : ' />'})

" fix commend for special filetype
autocmd FileType javascript.jsx setlocal commentstring=\{/\*\ %s\ \*/\}
autocmd FileType htmldjango setlocal commentstring=\{#\ %s\ #\}

" use meta key to navigate tab
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt

" use tab to navigation between window
nnoremap <tab> <C-w>w
nnoremap <S-tab> <C-w>W

" change theme to badwolf
silent! colorscheme badwolf

" config for word motion
nmap dw de
nmap cw ce

" faster move from insert mode to normal mode
set timeoutlen=1000 ttimeoutlen=0

" open new buffer in left, and bellow
set splitright
set splitbelow

" change emmet leader key
let g:user_emmet_leader_key=','
