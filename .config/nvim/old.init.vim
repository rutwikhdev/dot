"Plugins
call plug#begin('~/.vim/plugged')

"git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'jiangmiao/auto-pairs'
Plug 'nicwest/vim-http'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'stevearc/aerial.nvim'
Plug 'airblade/vim-gitgutter'

"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/lsp_signature.nvim'

"syntax hilighting
Plug 'sheerun/vim-polyglot'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/goyo.vim'
Plug 'posva/vim-vue'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }

"Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"flutter
Plug 'nvim-lua/plenary.nvim'
Plug 'akinsho/flutter-tools.nvim'

"themes
Plug 'doums/darcula'
Plug 'arcticicestudio/nord-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'NLKNguyen/papercolor-theme'
Plug 'wuelnerdotexe/vim-enfocado'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'ThePrimeagen/vim-be-good'

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
set noet
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
autocmd BufRead * autocmd FileType <buffer> ++once
  \ if &ft !~# 'commit\|rebase' && line("'\"") > 1 && line("'\"") <= line("$") | exe 'normal! g`"' | endif
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
let g:airline_theme = 'gruvbox_material'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline_section_z = airline#section#create(["L" . '%{line(".")}' . ":C" . '%{col(".")}'])
"let g:startify_change_to_dir = 0
let g:gruvbox_material_background = "soft"
let g:enfocado_style = 'nature' " Available: `nature` or `neon`.

set background=dark
set termguicolors
colorscheme gruvbox-material