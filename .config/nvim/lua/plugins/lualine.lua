return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      icons_enabled = false,
      component_separators = '·',
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_a = {
        { 'mode', separator = { left = '' } },
      },
      lualine_b = { 'filename', 'branch' },
      lualine_c = { 'fileformat' },
      lualine_x = {},
      lualine_y = { 'filetype', 'progress' },
      lualine_z = {
        { 'location', separator = { right = '' } },
      },
    },
  },
}
