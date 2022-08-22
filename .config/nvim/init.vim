"Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'nicwest/vim-http'
Plug 'posva/vim-vue'
"Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'sainnhe/gruvbox-material'
Plug 'tomasiser/vim-code-dark'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'navarasu/onedark.nvim'
Plug 'jacoborus/tender.vim'
Plug 'davidosomething/vim-colors-meh'
Plug 'YorickPeterse/vim-paper'
Plug 'jaredgorski/fogbell.vim'
Plug 'Jorengarenar/vim-darkness'


call plug#end()

"Sets
set encoding=UTF-8
set nu
syntax on
set relativenumber
"set cursorline
set signcolumn=yes
set noshowmode
set noswapfile
set backupcopy=yes
set scrolloff=10
set binary
set noeol
set noexpandtab
set autoread
set showmatch
set nohls
set ignorecase
set smartcase
set incsearch
set mouse=a
set completeopt=menu,menuone,noselect
set updatetime=100

"Functions
fun! TrimWhitespace()
let l:save = winsaveview()
keeppatterns %s/\s\+$//e
call winrestview(l:save)
endfun
"autocmd BufWritePre * :call TrimWhitespace()

"Plugins setting
"vim-http
let g:vim_http_split_vertically = 1
let g:vim_http_temp_buffer = 1
"fzf
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'top:60%' --layout reverse"
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
"lsp
luafile ~/.config/nvim/lsp/lsp-config.lua
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>

"REMAPS
let mapleader = " "
map <leader>gs :G<CR>
nnoremap <leader>p :GFiles?<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>e :bro ol<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>n :Files ~/second-brain<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
inoremap kj <Esc>

let g:vue_pre_processors = ['pug', 'scss']

"theme and terminal color settings
let g:airline_theme = 'codedark'
let g:onedark_config = {'style': 'darker'}
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = "\uE0B8"
let g:airline_right_sep = "\uE0BA"
let g:airline_section_z = airline#section#create(["L" . '%{line(".")}' . ":C" . '%{col(".")}'])
let g:startify_change_to_dir = 0
let g:material_theme_style = 'darker-community'
let g:material_terminal_italics = 1

set background=dark
set termguicolors

color codedark
