"Plugins
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'nicwest/vim-http'
Plug 'posva/vim-vue'
Plug 'davidosomething/vim-colors-meh'
Plug 'habamax/vim-bronzage'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

call plug#end()


"Sets
set nu
syntax on
set relativenumber
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
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse"
let g:fzf_layout = { 'window': { 'width': 1, 'height': 1 } }
"lsp
luafile ~/.config/nvim/lsp/lsp-config.lua


"REMAPS
let mapleader = " "
map <leader>gs :G<CR>
nnoremap <leader>p :GFiles?<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>e :bro ol<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>s :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
inoremap kj <Esc>


"theme and terminal color settings
let g:vue_pre_processors = ['pug', 'scss']
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline_left_sep = "\uE0B8"
"let g:airline_right_sep = "\uE0BA"
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline_section_z = airline#section#create(["L" . '%{line(".")}' . ":C" . '%{col(".")}'])
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
set background=dark
let g:meh_pandoc_enabled = 1
"set termguicolors
colorscheme meh