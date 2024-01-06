" Have j and k navigate visual lines rather than logical ones
nmap j gj
nmap k gk

" Yank to system clipboard
set clipboard=unnamed

exmap surround_wiki surround [[ ]]
exmap surround_double_quotes surround " "
exmap surround_single_quotes surround ' '
exmap surround_backticks surround ` `
exmap surround_brackets surround ( )
exmap surround_square_brackets surround [ ]
exmap surround_curly_brackets surround { }

" https://forum.obsidian.md/t/vim-o-and-o-should-respect-understand-current-context-lists/48386/14
" Make o and O respect context
exmap blankBelow obcommand obsidian-editor-shortcuts:insertLineBelow
exmap blankAbove obcommand obsidian-editor-shortcuts:insertLineAbove
nmap &a& :blankAbove
nmap &b& :blankBelow
nmap o &b&i
nmap O &a&i

" NOTE: must use 'map' and not 'nmap'
map [[ :surround_wiki
nunmap s
vunmap s
map s" :surround_double_quotes
map s' :surround_single_quotes
map s` :surround_backticks
map sb :surround_brackets
map s( :surround_brackets
map s) :surround_brackets
map s[ :surround_square_brackets
map s[ :surround_square_brackets
map s{ :surround_curly_brackets
map s} :surround_curly_brackets

" Emulates emacs in normal mode
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a

" mapping vs/hs as workspace split
exmap vs obcommand workspace:split-vertical
exmap hs obcommand workspace:split-horizontal
nnoremap <C-w>v :vs
nnoremap <C-w><C-v> :vs
nnoremap <C-w>s :hs
nnoremap <C-w><C-s> :hs
" window controls
exmap q obcommand workspace:close
" focus
exmap focusLeft obcommand editor:focus-left
exmap focusRight obcommand editor:focus-right
exmap focusBottom obcommand editor:focus-bottom
exmap focusTop obcommand editor:focus-top
nnoremap <C-w>h :focusLeft
nnoremap <C-w>l :focusRight
nnoremap <C-w>j :focusBottom
nnoremap <C-w>k :focusTop

" Emulate Folding https://vimhelp.org/fold.txt.html#fold-commands
exmap togglefold obcommand editor:toggle-fold
nmap zo :togglefold
nmap zc :togglefold
nmap za :togglefold

exmap unfoldall obcommand editor:unfold-all
nmap zR :unfoldall

exmap foldall obcommand editor:fold-all
nmap zM :foldall

" [z]pelling [l]ist (emulates `z=`)
exmap contextMenu obcommand editor:context-menu
nnoremap z= :contextMenu

exmap followLink :obcommand editor:follow-link
nnoremap <C-]> :followLink
