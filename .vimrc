"plugins
call plug#begin('~/.vim/plugged')

"git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"language support
Plug 'sheerun/vim-polyglot'
"tmuxLine
Plug 'edkolev/tmuxline.vim'
"auto completion
Plug 'jiangmiao/auto-pairs'
"file browser
Plug 'preservim/nerdtree'
"color and theme
Plug 'mohertz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"number settings
set nu
syntax on
set relativenumber
set signcolumn=yes

"don't create swap file
"set noswapfile
set backupcopy=yes

"always have 10 line at bottom while scrolling, don't scroll to the end
set scrolloff=10

"set statusline containing current cursor position
set ruler
set laststatus=2
set cursorline

"tabstop settings
set autoindent
"set smartindent
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

" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

"theme and terminal color settings
"air-line
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = 't'

" One dark
"let g:onedark_termcolors=256
"let g:onedark_hide_endofbuffer=1

" Gruvbox
"let g:gruvbox_temrcolors=16
"let g:gruvbox_termcolors=256

set background=dark
set termguicolors
colorscheme gruvbox 
