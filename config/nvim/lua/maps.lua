-- Remaps
vim.api.nvim_set_keymap('n', '<leader>f',"<cmd>lua require('fzf-lua').files()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s',"<cmd>lua require('fzf-lua').live_grep()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b',"<cmd>lua require('fzf-lua').buffers()<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h',"<cmd>lua require('fzf-lua').oldfiles()<CR>",{ noremap = true, silent = true })
