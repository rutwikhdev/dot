local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- Has to be set before init lazy
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
  -- Dev
  --{ '/home/razorquest/projects/frontier', dev=true },
  { import = 'plugins' },
}, {})

require 'core.options'
require 'core.keymaps'
