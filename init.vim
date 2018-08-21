" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" - https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')
" Make sure you use single quotes

" Sensible vim configuration to get a faster start
Plug 'tpope/vim-sensible'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Asynchronous linting/fixing with the language server protocol (LSP)
Plug 'w0rp/ale'

" Semantic language support
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/echodoc.vim'
" rustlang
Plug 'sebastianmarkow/deoplete-rust'
" swift
Plug 'landaire/deoplete-swift'
" python
Plug 'zchee/deoplete-jedi'
" javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" typescript
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" C/C++
Plug 'zchee/deoplete-clang'
" ocaml
Plug 'copy/deoplete-ocaml'


" Syntactic language support
" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" rustlang
Plug 'rust-lang/rust.vim'
" toml
Plug 'cespare/vim-toml'
" typescript
Plug 'HerringtonDarkholme/yats.vim'

" Initialize plugin system
call plug#end()

" Neovim requires python support for plugins
" https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim
let g:python_host_prog = '/Users/adrianbrink/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/adrianbrink/.pyenv/versions/neovim3/bin/python'

" autozimu/LanguageClient-neovim configuration
" Required for operations modifying multiple buffers like rename.
set hidden
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'haskell': ['hie-wrapper'],
    \}