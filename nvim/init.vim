" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" markdown
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'gabrielelana/vim-markdown'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" rust
Plug 'rust-lang/rust.vim'

" autocompletion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" go autocompletion
Plug 'zchee/deoplete-go', { 'do': 'make'}
" javascript autocompletion
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" rust autocompletion
Plug 'sebastianmarkow/deoplete-rust'
" typescript autocompletion
Plug 'mhartington/nvim-typescript', { 'do': './install.sh' }
" swift autocompletion
Plug 'mitsuse/autocomplete-swift'

" themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" nerdtree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'


" Initialize plugin system
call plug#end()

" deoplete requires python support
let g:python_host_prog = '/Users/adrianbrink/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/adrianbrink/.pyenv/versions/neovim3/bin/python'
let g:deoplete#enable_at_startup = 1

" themes
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" nerdtree
map <C-n> :NERDTreeToggle<CR>
