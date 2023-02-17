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
vim.keymap.set('n', '<leader>f', "<cmd>:Telescope find_files<CR>")
vim.keymap.set('n', '<leader>s', "<cmd>:Telescope live_grep<CR>")
vim.keymap.set('n', '<leader>l', "<cmd>:Telescope grep_string<CR>")
vim.keymap.set('n', '<leader>b', "<cmd>:Telescope buffers<CR>")
vim.keymap.set('n', '<leader>h', "<cmd>:Telescope oldfiles<CR>")
vim.keymap.set('n', '<leader>m', "<cmd>:Telescope help_tags<CR>")
vim.keymap.set('n', '<leader>c', "<cmd>:Telescope commands<CR>")
