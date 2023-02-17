local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/vim/plugged')

-- git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'

-- editing
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'

-- fuzzy
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

-- lsp
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'folke/neodev.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'ray-x/lsp_signature.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'github/copilot.vim'

-- style
Plug('nvim-treesitter/nvim-treesitter', {
    ['do'] = ':TSUpdate'
})
Plug 'sheerun/vim-polyglot'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'

-- colors
Plug 'tomasiser/vim-code-dark'
Plug 'Yazeed1s/oh-lucy.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'marko-cerovac/material.nvim'

-- random
Plug 'mhinz/vim-startify' -- startup menu
Plug 'nvim-tree/nvim-tree.lua' -- explorer
Plug 'windwp/nvim-ts-autotag' -- auto html tags
Plug 'mbbill/undotree'

vim.call('plug#end')

-- Variables
vim.g.startify_change_to_dir = 0
vim.g.startify_custom_header = ''
vim.g.fzf_layout = {
    window = {
        width = 1,
        height = 1
    }
}
vim.g.material_style = 'darker'
vim.g.material_theme_style = 'darker-community'

-- telescope
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require('telescope').setup {
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            height = 0.99,
            width = 0.99
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-h>"] = "which_key",
                ["<esc>"] = actions.close
            }
        }
    }
}

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

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        side = 'left',
        adaptive_size = true,
        mappings = {
            list = {{
                key = "u",
                action = "dir_up"
            }}
        }
    },
    renderer = {
        group_empty = true
    },
    filters = {
        dotfiles = true
    }
})

-- lsp setup
-- local cmp = require('cmp')
-- local nvim_lsp = require('lspconfig')

-- local on_attach = function(client, bufnr)
-- local function buf_set_keymap(...)
-- vim.api.nvim_buf_set_keymap(bufnr, ...)
-- end
-- local function buf_set_option(...)
-- vim.api.nvim_buf_set_option(bufnr, ...)
-- end
-- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

---- Mappings.
-- local opts = {
-- noremap = true,
-- silent = true
-- }
-- buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', '<space>lk', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
-- buf_set_keymap('n', '<space>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
-- buf_set_keymap('n', '<space>lw', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
-- buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
-- buf_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

---- Set some keybinds conditional on server capabilities
-- if client.server_capabilities.document_formatting then
-- buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
-- elseif client.server_capabilities.document_range_formatting then
-- buf_set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
-- end
---- Set autocommands conditional on server_capabilities
-- if client.server_capabilities.document_highlight then
-- vim.api.nvim_exec([[
-- hi LspReferenceRead cterm=bold ctermbg=red guibg=#44475a
-- hi LspReferenceText cterm=bold ctermbg=red guibg=#44475a
-- hi LspReferenceWrite cterm=bold ctermbg=red guibg=#44475a
-- augroup lsp_document_highlight
-- autocmd! * <buffer>
-- autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
-- autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
-- augroup END
-- ]], false)
-- end

-- require"lsp_signature".on_attach({
-- hint_enable = false,
-- handler_opts = {
-- border = "none"
-- }
-- })
-- end

-- cmp.setup({
-- snippet = {
-- expand = function()
-- end
-- },
-- mapping = {
-- ['<Tab>'] = cmp.mapping.select_next_item({
-- behavior = cmp.SelectBehavior.Insert
-- }),
-- ['<S-Tab>'] = cmp.mapping.select_prev_item({
-- behavior = cmp.SelectBehavior.Insert
-- }),
-- ['<C-j>'] = cmp.mapping.select_next_item({
-- behavior = cmp.SelectBehavior.Insert
-- }),
-- ['<C-k>'] = cmp.mapping.select_prev_item({
-- behavior = cmp.SelectBehavior.Insert
-- }),
-- ['<CR>'] = cmp.mapping.confirm({
-- behavior = cmp.ConfirmBehavior.Replace,
-- select = true
-- })
-- },
-- sources = {{
-- name = 'nvim_lsp',
-- max_item_count = 5
-- }, {
-- name = 'buffer',
-- max_item_count = 2
-- }, {
-- name = 'path',
-- max_item_count = 1
-- }}
-- })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
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
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

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
require('lspconfig').tsserver.setup = {
    on_attach = on_attach
}

require('lspconfig').rust_analyzer.setup {
    tools = {
        executor = require("rust-tools.executors").termopen,
        on_initialized = nil,
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
            auto = true,
            only_current_line = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "<- ",
            other_hints_prefix = "=> ",
            max_len_align = false,
            max_len_align_padding = 1,
            right_align = false,
            right_align_padding = 7,
            highlight = "Comment"
        },
        hover_actions = {
            border = {{"╭", "FloatBorder"}, {"─", "FloatBorder"}, {"╮", "FloatBorder"}, {"│", "FloatBorder"},
                      {"╯", "FloatBorder"}, {"─", "FloatBorder"}, {"╰", "FloatBorder"}, {"│", "FloatBorder"}},
            max_width = nil,
            max_height = nil,
            auto_focus = false
        },
        crate_graph = {
            backend = "x11",
            output = nil,
            full = true,
            enabled_graphviz_backends = {"bmp", "cgimage", "canon", "dot", "gv", "xdot", "xdot1.2", "xdot1.4", "eps",
                                         "exr", "fig", "gd", "gd2", "gif", "gtk", "ico", "cmap", "ismap", "imap",
                                         "cmapx", "imap_np", "cmapx_np", "jpg", "jpeg", "jpe", "jp2", "json", "json0",
                                         "dot_json", "xdot_json", "pdf", "pic", "pct", "pict", "plain", "plain-ext",
                                         "png", "pov", "ps", "ps2", "psd", "sgi", "svg", "svgz", "tga", "tiff", "tif",
                                         "tk", "vml", "vmlz", "wbmp", "webp", "xlib", "x11"}
        }
    },
    server = {
        standalone = true
    },
    dap = {
        adapter = {
            command = "lldb-vscode",
            name = "rt_lldb"
        }
    }
}

-- syntax highlighting
require('nvim-treesitter.configs').setup {
    ensure_installed = {"vue", "lua", "python", "tsx", "javascript", "typescript", "go", "rust"},
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
    },
    indent = {
        enable = true
    }
}


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

