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
