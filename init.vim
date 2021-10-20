"plugins
call plug#begin('~/.vim/plugged')

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"language support
Plug 'sheerun/vim-polyglot'
"auto completion
Plug 'jiangmiao/auto-pairs'
"file browser
Plug 'preservim/nerdtree'
Plug 'posva/vim-vue'
"color and theme
Plug 'joshdick/onedark.vim'
Plug 'Sainnhe/gruvbox-material'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"surrounding pairs
Plug 'tpope/vim-surround'

call plug#end()

"SETTINGS
"number settings
set nu
syntax on
set relativenumber
set signcolumn=yes
"don't create swap file
set noswapfile
set backupcopy=yes
"always have 10 lineat bottom while scrolling, don't scroll to the end
set scrolloff=10
"set statusline containing current cursor position
set ruler
set laststatus=2
set cursorline
"tabstop settings
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
"read for changes outside made from outside of vim
set autoread
"show matching '()', '[]', '{}'
set showmatch
"searching: no hilights, ignore casing, be smart, incremental search
set nohls
set ignorecase
set smartcase
set incsearch

set mouse=a

" Remove whitespaces before saving a file
fun! TrimWhitespace()
let l:save = winsaveview()
keeppatterns %s/\s\+$//e
call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()

"fzf
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
nnoremap <c-p> :GFiles?<cr>
nnoremap <c-m> :Files<cr>
nnoremap <c-o> :Rg<cr>

"theme and terminal color settings
"air-line
let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '

" One dark
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1

let g:vue_pre_processors = []

set background=dark
set termguicolors

colorscheme gruvbox-material
