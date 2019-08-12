" Nguyen Thanh Dat, 30/Jul/2019
" Credit from VimBootstrap, SpaceVim, dougblack, thinkvim, jarvis
" =============================

" PLUG IN {{{
call plug#begin('~/.vim/plugged')

" General

" Plug 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plug 'liuchengxu/vim-which-key' " Displays available keybindings in popup.
" Plug 'mattn/emmet-vim' " Provides support for expanding abbreviations
" Plug 'Shougo/echodoc.vim' " Print documents in echo area.
" Plug 'SirVer/ultisnips' " Ultimate solution for snippets
Plug 'Xuyuanp/nerdtree-git-plugin' " A plugin of NERDTree showing git status flags
Plug 'chaoren/vim-wordmotion' " More useful word motions
Plug 'chrisbra/NrrwRgn' " For focussing on a selected region
" Plug 'dense-analysis/ale' " Asynchronous Lint Engine
Plug 'dracula/vim', { 'as': 'dracula' } " Dracula theme
Plug 'junegunn/fzf.vim' " Things you can do with fzf and Vim
Plug 'junegunn/goyo.vim' " Distraction-free writing
Plug 'junegunn/limelight.vim' " Hyperfocus-writing
Plug 'junegunn/vim-easy-align' " A simple, easy-to-use Vim alignment
Plug 'mhartington/oceanic-next' " Neovim theme inspired by Oceanic Next for Sublime
Plug 'mhinz/vim-startify' " Provides a start screen
Plug 'morhetz/gruvbox' " Gruvbox Theme
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Coc is an intellisense engine
Plug 'scrooloose/nerdtree' " File system explorer
Plug 'simnalamburt/vim-mundo' " Visualize undo tree
Plug 't9md/vim-choosewin' "Land on window you chose like tmux's 'display-pane
Plug 'terryma/vim-multiple-cursors' " Multi cursors support
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Adds syntax for nerdtree on most common file extensions
Plug 'tpope/vim-commentary' " Comment stuff out
Plug 'tpope/vim-fugitive' " A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-repeat' " Repeat unnative command
Plug 'tpope/vim-surround' " Surround stuffs
Plug 'tpope/vim-unimpaired' " Complementary pairs of mappings
Plug 'vim-airline/vim-airline' " Draw a nice statusline
" Plug 'vim-airline/vim-airline-themes' " A collection of themes for vim-airline
Plug 'weilbith/nerdtree_choosewin-plugin' " Choosewin for NERDTree
Plug 'Yggdroot/indentLine' " Display the indention levels with thin vertical lines
Plug 'Chiel92/vim-autoformat' " Format code with one button press
Plug 'Valloric/MatchTagAlways' " Always highlights the XML/HTML tags that enclose your cursor location
Plug 'KabbAmine/vCoolor.vim' " Simple color selector/picker
Plug 'fatih/vim-go' " Adds Go language support
Plug '/home/dreamer/.fzf' " Local dir for fzf
" Plug 'airblade/vim-gitgutter' " Shows a git diff in the gutter (sign column) and stages/undoes hunks
Plug 'liuchengxu/vista.vim' " Viewer & Finder for LSP symbols and tags
Plug 'Bacbia3696/vim-snippets' " Contains snippets files for various programming languages
" This plugin should load last in line
Plug 'ryanoasis/vim-devicons' " Adds file type glyphs/icons to popular Vim plugins

call plug#end()
" }}}
" =============================
" CUSTOM KEYBIND {{{

" Save and quit
nnoremap <C-q> :quit!<CR>
nnoremap <C-s> :save %<CR>
nnoremap <M-s> :wa<CR>
inoremap <C-q> <ESC>:quit!<CR>
inoremap <C-s> <ESC>:save %<CR>a
inoremap <M-s> <ESC>:wa<CR>a
tnoremap <C-q> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode:
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" Open new tab
nnoremap <S-t> :$tabnew<CR>

" Navigate tab
nnoremap <M-0> tablast<CR>
inoremap <M-0> <ESC>tablast<CR>
nnoremap <M-1> 1gt<CR>
nnoremap <M-2> 2gt<CR>
nnoremap <M-3> 3gt<CR>
nnoremap <M-4> 4gt<CR>
nnoremap <M-5> 5gt<CR>
nnoremap <M-6> 6gt<CR>
nnoremap <M-7> 7gt<CR>
nnoremap <M-8> 8gt<CR>
nnoremap <M-9> 9gt<CR>
inoremap <M-1> <ESC>1gt<CR>
inoremap <M-2> <ESC>2gt<CR>
inoremap <M-3> <ESC>3gt<CR>
inoremap <M-4> <ESC>4gt<CR>
inoremap <M-5> <ESC>5gt<CR>
inoremap <M-6> <ESC>6gt<CR>
inoremap <M-7> <ESC>7gt<CR>
inoremap <M-8> <ESC>8gt<CR>
inoremap <M-9> <ESC>9gt<CR>
tnoremap <M-1> <C-\><C-n>1gt<CR>
tnoremap <M-2> <C-\><C-n>2gt<CR>
tnoremap <M-3> <C-\><C-n>3gt<CR>
tnoremap <M-4> <C-\><C-n>4gt<CR>
tnoremap <M-5> <C-\><C-n>5gt<CR>
tnoremap <M-6> <C-\><C-n>6gt<CR>
tnoremap <M-7> <C-\><C-n>7gt<CR>
tnoremap <M-8> <C-\><C-n>8gt<CR>
tnoremap <M-9> <C-\><C-n>9gt<CR>

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

" Scroll faster
nnoremap <C-y> <C-y><C-y><C-y>
nnoremap <C-e> <C-e><C-e><C-e>

" Navigate windows
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
nnoremap <C-h> :wincmd h<CR>
" tnoremap <C-j> <C-\><C-n>:wincmd j<CR>
" tnoremap <C-k> <C-\><C-n>:wincmd k<CR>
" tnoremap <C-l> <C-\><C-n>:wincmd l<CR>
" tnoremap <C-h> <C-\><C-n>:wincmd h<CR>

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

" Easy expansion of the active file directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" C-j C-k to move arrow
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>
cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" }}}
" =============================
" LEADER KEYBINDING {{{

" Pick leader key
let mapleader="\<Space>"


" open terminal
nnoremap <leader>' :vsplit term://zsh<CR>

" high light last past
nnoremap <leader>p `[v`]
" edit config file
nnoremap <leader>vf :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>:PlugInstall<CR>
" clear search
nnoremap <leader>sc :nohl<CR>
" quit all
nnoremap <leader>q :qa!<CR>

" Leader keybind for fzf search
nnoremap <leader>ff :call FZFWithDevIcons()<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fC :Colors<CR>
nnoremap <leader>fa :Ag<CR>
nnoremap <leader>fs :Rg<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>fS :Snippets<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fH :Helptags<CR>
nnoremap <leader>ft :Tags<CR>
nnoremap <leader>fgs :GFiles?<CR>
nnoremap <leader>fgf :GFiles<CR>
nnoremap <leader>fgc :GCommits<CR>
nnoremap <leader>fgb :BGCommits<CR>

" Toggle goyo
nnoremap <leader>G :Goyo<CR>

" Ale
" nmap <leader>ep <Plug>(ale_previous_wrap)
" nmap <leader>en <Plug>(ale_next_wrap)
" nmap <leader>ee :ALELint<CR>

" Coc list
nnoremap <leader>ll :CocList<CR>
nnoremap <leader>le :CocList extensions<CR>
nnoremap <leader>lS :CocList snippets<CR>
nnoremap <leader>li :CocList gitignore<CR>
nnoremap <leader>lp :CocList post<CR>
nnoremap <leader>lc :CocList commands<CR>
nnoremap <leader>lC :CocList colors<CR>
nnoremap <leader>lh :CocList cmdhistory<CR>
nnoremap <leader>ly :CocList yank<CR>
nnoremap <leader>lf :CocList files<CR>
nnoremap <leader>lM :CocList maps<CR>
nnoremap <leader>lm :CocList marketplace<CR>

" Buffer hotkey
nnoremap <leader>bd :bd!<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bs :w<CR>
nnoremap <leader>bS :wa<CR>
nnoremap <leader>bl :ls<CR>
nnoremap <leader>bh :Startify<CR>
nnoremap <leader>ba ggVG<CR>

" Window hotkey
nnoremap <leader>wq :q!<CR>
nnoremap <leader>wQ :qa!<CR>
nnoremap <leader>ww :wq<CR>
nnoremap <leader>wW :wqa<CR>
nnoremap <leader>wo :on<CR>

" Coc
nnoremap <leader>cc :CocCommand<CR>
nnoremap <leader>cf :CocConfig<CR>

"" Git
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gl :Gpull<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gd :Gvdiff<CR>
nnoremap <Leader>gr :Gremove<CR>
nnoremap <Leader>go :.Gbrowse<CR>

" }}}
" =============================
" THEME AND DISPLAY {{{

" Display all white space character
" https://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character/1675698
"↵,→,~,↷,↶,·,¬,⇨,⋄,‸
set listchars=eol:↵,tab:⇨\ ,trail:⋄,space:·
set list
syntax on
set termguicolors " use terminal gui color as background
" let g:oceanic_next_terminal_bold = 1
" let g:oceanic_next_terminal_italic = 1
" colorscheme OceanicNext
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"
colorscheme dracula

"" }}}
" =============================
" CHANGE DEFAULT BEHAVIOR {{{

set noshowmode " don't dispay mode in command line (airilne already shows it)
set number relativenumber " show relative number
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o " disable autocomment the next line
set tabstop=4       " number of visual spaces per TAB
set shiftwidth=4    " number of space move for 1 shift
set expandtab       " tabs are spaces
set wrap linebreak  " make break line
set clipboard=unnamed,unnamedplus " use main clipboard
set ignorecase smartcase " use smart case
let g:python3_host_prog="/home/dreamer/.pyenv/nvim/bin/python3" " set default python path
set pyx=3 " set pythonx
" Remove delay time when switch to normal mode
" https://www.johnhawthorn.com/2012/09/vi-escape-delays/
set timeoutlen=1000 ttimeoutlen=0 " Default for timeoutlen is 1000
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
set dictionary+=/usr/share/dict/words " use dictionary
set mouse=a " enable mouse support
set cursorline " highlight current line
set hidden " allow open other buffer when current buffer is unsave

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Ignore some filetype
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" }}}
" =============================
" PLUGIN CONFIGURATION {{{
" autoformat {{{
noremap <F4> :Autoformat<CR>
" }}}
" multi_cursor {{{
" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" }}}
" mundo {{{
nnoremap <F6> :MundoToggle<cr>
" }}}
" choosewin {{{
nmap - <Plug>(choosewin)
let g:choosewin_overlay_enable = 1
" }}}
" nerdtree {{{
map <F3> :NERDTreeToggle<CR>
let g:NERDTreeAutoDeleteBuffer = 1 " Delete buffer when remove file
let g:NERDTreeMinimalUI = 1 " Hide ? icon
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'
" }}}
" goyo {{{
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
" }}}
" ease_algin {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}
" emmet {{{
" let g:user_emmet_leader_key=','
" let g:user_emmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" }}}
" unti_snips{{{
" let g:UltiSnipsExpandTrigger="<C-y>"
" let g:UltiSnipsListSnippets="<C-tab>"
" let g:UltiSnipsJumpForwardTrigger="<C-j>"
" let g:UltiSnipsJumpBackwardTrigger="<C-k>"
" let g:UltiSnipsEnableSnipMate=0
" }}}
" ale {{{
" " Ale check only when save
" let g:ale_lint_on_text_changed = 'never'
" let g:ale_lint_on_insert_leave = 0
" " " if you don't want linters to run on opening a file
" " let g:ale_lint_on_enter = 0
" " see the status for ALE
" let g:airline#extensions#ale#enabled = 1
" " set linter for js
" let g:ale_linters = {
"             \ 'javascript': ['eslint'],
"             \ 'go': ['gopls'],
"             \}
" }}}
" echodoc {{{
" let g:echodoc#enable_at_startup = 1
" let g:echodoc#type = 'floating'
" " To use a custom highlight for the float window,
" " change Pmenu to your highlight group
" highlight link EchoDocFloat Pmenu
" }}}
" nerdtree-syntax-highlight {{{
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" }}}
" fzf {{{
" https://github.com/ryanoasis/vim-devicons/issues/106
function! FZFWithDevIcons()
    let l:fzf_files_options = ' -m --bind ctrl-d:preview-page-down,ctrl-u:preview-page-up --preview "bat --color always --style numbers {2..}"'

    function! s:files()
        let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
        return s:prepend_icon(l:files)
    endfunction

    function! s:prepend_icon(candidates)
        let result = []
        for candidate in a:candidates
            let filename = fnamemodify(candidate, ':p:t')
            let icon = WebDevIconsGetFileTypeSymbol(filename, isdirectory(filename))
            call add(result, printf("%s %s", icon, candidate))
        endfor

        return result
    endfunction

    function! s:edit_file(items)
        let items = a:items
        let i = 1
        let ln = len(items)
        while i < ln
            let item = items[i]
            let parts = split(item, ' ')
            let file_path = get(parts, 1, '')
            let items[i] = file_path
            let i += 1
        endwhile
        call s:Sink(items)
    endfunction

    let opts = fzf#wrap({})
    let opts.source = <sid>files()
    let s:Sink = opts['sink*']
    let opts['sink*'] = function('s:edit_file')
    let opts.options .= l:fzf_files_options
    call fzf#run(opts)

endfunction
" }}}"
" word_motion {{{
nmap dw de
nmap cw ce
xmap dw de
xmap cw ce
" }}}"
" coc.nvim {{{

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
" Default is 4000
set updatetime=100

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Coc Snippets
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" " Make Tab to move, default is <C-j> <C-k>
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
" Make CR to confirm snip, default is <C-y>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
            \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <C-y> <C-n><C-p><ESC>a

" Coc smartf
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

augroup Smartf
    autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#F05050
    autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

" Highlight comment json
autocmd FileType json syntax match Comment +\/\/.\+$+

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" " always show signcolumns
" set signcolumn=yes

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}
" which_key {{{
" By default timeoutlen is 1000 ms
set timeoutlen=500
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>

" Define prefix dictionary
let g:which_key_map =  {}

let g:which_key_map.v = { 'name' : '+vim' }
let g:which_key_map.c = { 'name' : '+coc_config' }
let g:which_key_map.l = { 'name' : '+coc_list' }
let g:which_key_map.f = { 'name' : '+fzf' }
let g:which_key_map.e = { 'name' : '+ale' }
let g:which_key_map.p = { 'name' : 'select_last_paste' }
let g:which_key_map.w = { 'name' : '+window' }
let g:which_key_map.b = { 'name' : '+buffer' }
let g:which_key_map.g = { 'name' : '+git' }
" }}}"
" vim-go {{{
" disable key binding
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0
let g:go_code_completion_enabled = 1
" }}}
" vim_ariline {{{
" Enable powerline fonts
let g:airline_powerline_fonts = 1
" Enable extensions
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
" Use straight bar fot tabline
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
"}}}
" git_gutter {{{
" let g:gitgutter_highlight_lines = 1
" }}}
" vista {{{
nnoremap <F2> :Vista!!<CR>
"FIXME
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_highlight_whole_line=1

let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']

let g:vista_executive_for = {
  \ 'go': 'ctags',
  \ 'javascript': 'coc',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'ctags',
  \ }
" }}}

" }}}
" =============================
" CUSTOM FUNCTION {{{
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunc
" Toggle transparent
" https://www.reddit.com/r/vim/comments/74pw75/how_to_toggle_transparent_background_in_vim/
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        set nocursorline
        let t:is_transparent = 1
    else
        set background=dark
        set cursorline
        let t:is_tranparent = 0
    endif
endfunction
nnoremap <C-t> : call Toggle_transparent()<CR>
" }}}
" =============================
" AUTO GROUPS {{{
augroup configgroup
    autocmd!
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb :call <SID>StripTrailingWhitespaces()
    autocmd BufWritePre,BufRead *.html setlocal ts=2 sw=2
    autocmd BufWritePre,BufRead *.sh setlocal ts=2 sw=2
    autocmd BufWritePre,BufRead Makefile setlocal noexpandtab
    autocmd BufWritePre,BufRead *.go setlocal noexpandtab
    autocmd TermOpen * setlocal statusline=%{b:term_title}
    autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
    autocmd BufRead,BufNewFile *.gohtml set filetype=gohtmltmpl
augroup END
" }}}
" =============================

" vim:foldmethod=marker:foldlevel=0
