return {  'VonHeikemen/lsp-zero.nvim',
       branch = 'v2.x',
       dependencies = {
           -- LSP Support
           {'neovim/nvim-lspconfig'},             -- Required
           {'williamboman/mason.nvim'},           -- Optional
           {'williamboman/mason-lspconfig.nvim'}, -- Optional

           -- Autocompletion
           {'hrsh7th/nvim-cmp'},     -- Required
           {'hrsh7th/cmp-nvim-lsp'}, -- Required
           {'L3MON4D3/LuaSnip'},     -- Required
       },
       config = function()

           local lsp = require('lsp-zero').preset({})
           lsp.on_attach(function(client, bufnr)
             -- see :help lsp-zero-keybindings
             -- to learn the available actions
             lsp.default_keymaps({buffer = bufnr})
           end)
           lsp.ensure_installed({
             -- Replace these with whatever servers you want to install
             'jedi_language_server', -- Python
             'fortls', -- Fortran
             'pkgbuild_language_server', -- bash 
             'clangd', -- C
             'ltex',   -- LaTeX
             'lua_ls', -- Lua
             'marksman', -- Markdown
           })
           -- (Optional) Configure lua language server for neovim
           require('lspconfig').lua_ls.setup({
               lsp.nvim_lua_ls(),
           --  settings = {diagnostics = {globals = {"vim"}}}
           })
           lsp.set_preferences({
           	ssign_icons = { }
           })
           lsp.setup()
           -- Make sure you setup `cmp` after lsp-zero
           local cmp = require('cmp')
           cmp.setup({
             mapping = {
               ['<CR>'] = cmp.mapping.confirm({select = false}),
             }
           })
       end
   }
