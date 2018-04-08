"----------------------
" Plugins
"----------------------
call plug#begin('~/.local/share/nvim/plugged')

" Nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git bits
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" make tab do all
Plug 'ervandew/supertab'

" Autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Go
Plug 'zchee/deoplete-go', { 'do': 'make'}
" Rust
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
" Javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Linty lint
Plug 'w0rp/ale'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Go
Plug 'fatih/vim-go'

" Misc
Plug 'ekalinin/Dockerfile.vim'
Plug 'elzr/vim-json'
" see contents of registers real quick
Plug 'junegunn/vim-peekaboo'
" fuzzy file search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' } | Plug 'junegunn/fzf.vim'
" emoji, the blood of life
Plug 'junegunn/vim-emoji'

" pretty colours
Plug 'chriskempson/base16-vim'

" Status Bar + Buffer Bar
Plug 'vim-airline/vim-airline'
Plug '22a/vim-airline-themes'

" visual indentation levels
Plug 'nathanaelkane/vim-indent-guides'

" Seeing whitespace is fun
Plug 'ntpeters/vim-better-whitespace'

" editor config
Plug 'editorconfig/editorconfig-vim'

" Tagbar
Plug 'majutsushi/tagbar'

" Initialize plugin system
call plug#end()

let g:python_host_prog = '/Users/avo/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/avo/.pyenv/versions/neovim3/bin/python'

"----------------------
"" General Wizardry
"----------------------

" no folding please
set nofoldenable

" Only highlight the first 120 columns, no more minified spookery
set synmaxcol=256

" spelling is hard
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" gutter
set relativenumber
set number

" cursor
set cursorline

" files
set nobackup
set noswapfile
set nowritebackup

" soft-tabs
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set autoindent

" shame
set noerrorbells
set visualbell

" scroll padding
set scrolloff=15
set sidescrolloff=15

" sane vim split directions
set splitright
set splitbelow

"----------------------
"" Autocomplete
"----------------------
let g:deoplete#enable_at_startup = 1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }


"----------------------
"" Linting
"----------------------


"----------------------
" Key Bindings
"----------------------
" Cold turkey is best turkey, arrow keys are slow<Paste>
for prefix in ['i', 'n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Ctrl-P for fzf
nnoremap <C-p> :FZF<CR>

" easier split nav
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"----------------------
" Leader Commands
"----------------------

" civ4 victory by space-race
let mapleader = ","

" Easily do plugin things
nnoremap <Leader>PI :PlugInstall<CR>
nnoremap <Leader>PU :PlugUpdate<CR>
nnoremap <Leader>PC :PlugClean<CR>

" Trim Leading WS
nnoremap <Leader>tw :call TrimWhitespace()<CR>

" fast file rename
nnoremap <Leader>rf :call RenameFile()<cr>

" fast edit nvim rc
nnoremap <Leader>rc :e ~/dotfiles/nvimrc<CR>

" writing files is too slow
nnoremap <Leader>w :w<CR>

" closing buffers is too slow
nnoremap <Leader>c :bd<CR>
nnoremap <Leader>C :bd!<CR>

" closing everything is too slow
nnoremap <Leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" easy toggle things
nnoremap <Leader>W :set wrap!<CR>
nnoremap <Leader>S :set spell!<CR>
nnoremap <Leader>P :set paste!<CR>

"----------------------
" Colour Things
"----------------------

" true colours awwww yeeee
set termguicolors
colorscheme base16-spacemacs

" show filthy whitespace in white
highlight ExtraWhitespace guibg=white

" 80 is a number that people care about
set colorcolumn=80

" indent guide colors
" base16 bg is #1F2022, so i've just bumped up to #222426 and #242628
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#242628
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222426

"----------------------
" Buffers
"----------------------

" hop from file to file without saving
set hidden

" cycle through buffers
map <Leader><tab> :bn<CR>
map <Leader>` :bp<CR>
map ` :EasyBuffer<CR>

"--------------------------
" Misc
"-------------------------

" Tagbar
map <C-s> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits,traits',
        \'i:impls,trait implementations',
    \]
\}

" Nerdtree
map <C-n> :NERDTreeToggle<CR>

"----------------------
" Helpful Functions
"----------------------

function! TrimWhitespace()
  let l = line('.')
  let c = col('.')
  %s/\s\+$//e
  call cursor(l, c)
endfunc

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
