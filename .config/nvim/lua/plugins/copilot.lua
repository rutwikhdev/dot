return   {
    "github/copilot.vim",
    event = 'VeryLazy',
    config = function ()
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<A-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
    end,
  }
