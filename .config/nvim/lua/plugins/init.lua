-- Plugins that don't require configuration

return {
  -- Git related plugins
  'tpope/vim-fugitive',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- surround text with symbols
  { 'tpope/vim-surround' },
}
