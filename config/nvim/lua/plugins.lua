local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/vim/plugged')

Plug('tpope/vim-fugitive')
Plug('tpope/vim-rhubarb')
Plug('jiangmiao/auto-pairs')
Plug('nicwest/vim-http')
Plug('preservim/nerdcommenter')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim', {['tag'] = '0.1.0' })
Plug('tpope/vim-surround')
Plug('airblade/vim-gitgutter')
Plug('ibhagwan/fzf-lua', {['branch'] = 'main'})
--Plug ('kyazdani42/nvim-web-devicons')

Plug('neovim/nvim-lspconfig')
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/nvim-cmp')
Plug('ray-x/lsp_signature.nvim')

Plug('sheerun/vim-polyglot')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = vim.fn[':TSUpdate']})
Plug('junegunn/goyo.vim')
Plug('posva/vim-vue')
--Plug('prettier/vim-prettier', { ['do'] = vim.fc['yarn install --frozen-lockfile --production'], ['for'] = ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] })

Plug('mhinz/vim-startify')
Plug('ryanoasis/vim-devicons')
Plug('vim-airline/vim-airline')
Plug('vim-airline/vim-airline-themes')
Plug 'nvim-lualine/lualine.nvim'

Plug('nvim-lua/plenary.nvim')
Plug('akinsho/flutter-tools.nvim')

Plug('doums/darcula')
Plug('arcticicestudio/nord-vim')
Plug('tomasiser/vim-code-dark')
Plug('NLKNguyen/papercolor-theme')
Plug('wuelnerdotexe/vim-enfocado')
Plug('morhetz/gruvbox')
Plug('sainnhe/gruvbox-material')
Plug('ThePrimeagen/vim-be-good')

vim.call('plug#end')

-- Variables
vim.g['startify_change_to_dir'] = 0
vim.g['gruvbox_material_background'] = "hard"
vim.g['enfocado_style'] = 'nature'

-- lualine setup
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox-material',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
    },
    tabline = {
        lualine_a = {'buffers'},
        lualine_b = {'branch'},
    }
}

-- lsp setup
local cmp = require('cmp')
local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>lw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>lq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.server_capabilities.document_formatting then
    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.server_capabilities.document_range_formatting then
    buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end
  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=#44475a
      hi LspReferenceText cterm=bold ctermbg=red guibg=#44475a
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=#44475a
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  require "lsp_signature".on_attach({
    hint_enable = false,
    handler_opts = {
      border = "none",
    }
  })
end

cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<CR>'] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true})
    },
    sources = {
      { name = 'nvim_lsp', max_item_count = 5},
      { name = 'buffer', max_item_count = 2},
      { name = 'path', max_item_count = 1},
    }
})

nvim_lsp['pyright'].setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach=on_attach,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = "off",
        diagnosticMode = "openFilesOnly",
			},
		}
	}
}

nvim_lsp.tsserver.setup {
  on_attach=on_attach
}

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

--require("flutter-tools").setup{}
