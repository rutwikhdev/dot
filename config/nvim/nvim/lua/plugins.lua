local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',
	'preservim/nerdcommenter',
	'tpope/vim-surround',
	 'nvim-lua/plenary.nvim',
	 'williamboman/mason.nvim',
	 'williamboman/mason-lspconfig.nvim',
	 'neovim/nvim-lspconfig',
	 'folke/neodev.nvim',
	 'hrsh7th/nvim-cmp',
	 'hrsh7th/cmp-nvim-lsp',
	 'ray-x/lsp_signature.nvim',
	 'simrat39/rust-tools.nvim',
	 'github/copilot.vim',
	 'nvim-treesitter/nvim-treesitter',
	 'sheerun/vim-polyglot',
	 'kyazdani42/nvim-web-devicons',
	 'nvim-lualine/lualine.nvim',
	 'Yazeed1s/oh-lucy.nvim',
	 'marko-cerovac/material.nvim',
	 'folke/tokyonight.nvim',
	 'mhinz/vim-startify',
	 'nvim-tree/nvim-tree.lua',
	 'mbbill/undotree',
    { 
      "junegunn/fzf", build = "./install --all" 
    },
    'junegunn/fzf.vim',
    'ellisonleao/gruvbox.nvim',
    'Mofiqul/dracula.nvim',
    'sainnhe/gruvbox-material',
    {
      'luisiacc/gruvbox-baby', branch = 'main'
    }
}

local opts = {}

require("lazy").setup(plugins, opts)

-- Variables
vim.g.startify_change_to_dir = 0
vim.g.startify_custom_header = ''
vim.g.fzf_layout = {
    window = {
        width = 1,
        height = 1
    }
}

vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.material_style = "darker"
vim.g.onedark_terminal_italics = 1

vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap('n', '<leader>o',"<cmd>:Copilot<CR>",{ noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<S-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })


-- treesitter setup
require'nvim-treesitter.configs'.setup {}

-- lualine setup
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        }
    },
    tabline = {
        lualine_a = {{
            'buffers',
            max_length = vim.o.columns * 2 / 3,
            buffers_color = {
                active = {
                    bg = '#80A2BF',
                    fg = '#1E1D23'
                },
                inactive = {
                    bg = '#1E1D23',
                    fg = '#B5B0AB'
                }
            },
            symbols = {
                modified = ' ●',
                alternate_file = '',
                directory = ''
            }
        }},
        lualine_b = {'branch'}
    }
}

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#1B1D26',
  fg       = '#c9c7cd',
  yellow   = '#e6b99d',
  cyan     = '#ea83a5',
  darkblue = '#081633',
  green    = '#90b99f',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#e29eca',
  blue     = '#aca1cf',
  red      = '#f5a191',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- lsp setup
 local cmp = require('cmp')
 local nvim_lsp = require('lspconfig')

 local on_attach = function(client, bufnr)
 local function buf_set_keymap(...)
     vim.api.nvim_buf_set_keymap(bufnr, ...)
 end
 local function buf_set_option(...)
     vim.api.nvim_buf_set_option(bufnr, ...)
 end
 buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
 local opts = {
     noremap = true,
     silent = true
 }

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

 require"lsp_signature".on_attach({
     hint_enable = false,
     handler_opts = {
         border = "none"
     }
 })
 end

 cmp.setup({
         snippet = {
         expand = function()
     end
     },
 mapping = {
     ['<Tab>'] = cmp.mapping.select_next_item({
         behavior = cmp.SelectBehavior.Insert
     }),
     ['<S-Tab>'] = cmp.mapping.select_prev_item({
         behavior = cmp.SelectBehavior.Insert
     }),
     ['<C-j>'] = cmp.mapping.select_next_item({
         behavior = cmp.SelectBehavior.Insert
     }),
     ['<C-k>'] = cmp.mapping.select_prev_item({
         behavior = cmp.SelectBehavior.Insert
     }),
     ['<CR>'] = cmp.mapping.confirm({
         behavior = cmp.ConfirmBehavior.Replace,
         select = true
     })
 },
 sources = {{
     name = 'nvim_lsp',
     max_item_count = 5
     }, {
     name = 'buffer',
     max_item_count = 2
     }, {
     name = 'path',
     max_item_count = 1
     }}
 })

local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, {
            buffer = bufnr,
            desc = desc
        })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    --nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    --nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    --nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, {
        desc = 'Format current buffer with LSP'
    })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
    -- clangd = {},
    -- gopls = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
require('mason').setup()
require("mason-lspconfig").setup()

require('lspconfig').pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeCheckingMode = "off",
                diagnosticMode = "openFilesOnly"
            }
        }
    }
}
--require('lspconfig').tsserver.setup = {
 --   on_attach = on_attach
--}
require('lspconfig').volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}


require("nvim-tree").setup()

require('gitsigns').setup {
    signs = {
        add = { text = '│' },
        change = {
            text = '│'
        },
        delete = {
            text = '_'
        },
        topdelete = {
            text = '‾'
        },
        changedelete = {
            text = '~'
        },
        untracked = {
            text = '│'
        }
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        interval = 1000,
        follow_files = true
    },
    attach_to_untracked = true,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = {
        enable = false
    },
     on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer)
    map('n', '<leader>hu', gs.undo_stage_hunk)
    map('n', '<leader>hR', gs.reset_buffer)
    map('n', '<leader>hp', gs.preview_hunk)
    map('n', '<leader>hd', gs.diffthis)
    map('n', '<leader>hD', function() gs.diffthis('~') end)
    map('n', '<leader>td', gs.toggle_deleted)

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  end
  }

