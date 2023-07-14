--REMAPS
vim.keymap.set('n', '<leader>gs', vim.cmd.G)

vim.keymap.set('i', 'kj', "<Esc>")
vim.keymap.set('n', '<leader>pv', vim.cmd.NvimTreeToggle)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('n', '<leader>o',"<cmd>:Copilot<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>oe',"<cmd>:Copilot enable<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>os',"<cmd>:Copilot status<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Telescope
vim.keymap.set('n', '<leader>f', "<cmd>:Files<CR>")
vim.keymap.set('n', '<leader>s', "<cmd>:Rg<CR>")
vim.keymap.set('n', '<leader>b', "<cmd>:Buffers buffers<CR>")
vim.keymap.set('n', '<leader>h', "<cmd>:History oldfiles<CR>")
