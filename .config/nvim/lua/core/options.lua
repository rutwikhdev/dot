-- Auto read file when changed from outside
vim.o.autoread = true

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.o.relativenumber = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Always have at least 15 lines visible top and bottom
vim.o.scrolloff = 15

-- Tab
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = false
vim.o.eol = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 100

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Hide commandline below lualine
vim.o.ch = 0

-- Alternate escape
vim.keymap.set('i', 'kj', '<Esc>')

-- Assembly syntax highlighting
vim.cmd 'autocmd BufNewFile,BufRead *.asm setfiletype asm'


vim.g.gruvbox_material_background = 'hard'

