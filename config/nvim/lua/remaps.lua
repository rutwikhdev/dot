--REMAPS
vim.keymap.set("n", "<leader>gs", vim.cmd.G)

vim.keymap.set("i", "kj", "<Esc>")
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

--vim.api.nvim_set_keymap('n', '<leader>f',"<cmd>:Files<CR>",{ noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>s',"<cmd>:Rg<CR>",{ noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>b',"<cmd>:Buffers<CR>",{ noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>h',"<cmd>:History<CR>",{ noremap = true, silent = true })

vim.keymap.set("n", "<leader>f", "<cmd>:Files<CR>")
vim.keymap.set("n", "<leader>s", "<cmd>:Rg<CR>")
vim.keymap.set("n", "<leader>b", "<cmd>:Buffers<CR>")
vim.keymap.set("n", "<leader>h", "<cmd>:History<CR>")
