vim.g.mapleader = " "

vim.o.encoding = "utf-8"
vim.o.number = true
vim.o.relativenumber = true
vim.o.showmode = false
vim.o.swapfile = false
vim.cmd("filetype plugin on")
--vim.o.singlecolumn = true
vim.o.binary = true
vim.o.eol = false
vim.o.et = false
vim.o.autoread = true
vim.o.showmatch = true
vim.o.showcmd = true
vim.o.hls = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true
vim.o.wrap = true
vim.o.sidescroll = 1
vim.cmd([[set mouse=a]])
vim.o.completeopt = menu, menuone, noselect
vim.o.updatetime = 100
vim.o.termguicolors = true
vim.o.ch = 0
--Lua:
vim.o.background = "dark"
vim.cmd([[colorscheme kanagawa-dragon]])