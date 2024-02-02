return {
  {
    'rebelot/kanagawa.nvim',
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('bamboo').setup {
        highlights = {
          ['@comment'] = { fg = '#727169' },
        },
      }

      vim.cmd 'colorscheme onedark'
    end,
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard'
    end,
  }
}
