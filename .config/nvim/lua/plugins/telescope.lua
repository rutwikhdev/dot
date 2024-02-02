-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
-- local telescope_actions = require 'telescope.actions'

-- Enable telescope fzf native, if installed
-- pcall(require('telescope').load_extension, 'fzf')

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  config = function()
    local actions = require 'telescope.actions'
    pcall(require('telescope').load_extension, 'fzf')

    require('telescope').setup {
      defaults = {
        layout_strategy = 'vertical',
        layout_config = {
          prompt_position = 'top',
          preview_cutoff = 20,
          height = 0.98,
          width = 0.98,
        },
        mappings = {
          i = {
            ['<esc>'] = actions.close,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
          },
        },
      },
    }
  end,
}
