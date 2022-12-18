--Remaps
vim.keymap.set('n', '<leader>gs', vim.cmd.G)
vim.keymap.set('n', '<leader>f', vim.cmd.Files)
vim.keymap.set('n', '<leader>s', vim.cmd.Rg)
vim.keymap.set('n', '<leader>b', vim.cmd.Buffers)
vim.keymap.set('n', '<leader>h', vim.cmd.History)


vim.keymap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle)
vim.keymap.set('i', 'kj', "<Esc>")
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

--alternative
--vim.api.nvim_set_keymap('n', '<leader>pv',"<cmd>:NvimTreeToggle<CR>",{ noremap = true, silent = true })
