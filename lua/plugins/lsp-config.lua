return {
	{
		"williamboman/mason.nvim",
        lazy = false,
		config = function()
			require("mason").setup(
            )
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
        lazy = false,
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"jedi_language_server", -- Python
					"fortls", -- Fortran
					--               'pkgbuild_language_server', -- bash
					"clangd", -- C
					"ltex", -- LaTeX
					"lua_ls", -- Lua
					"marksman", -- Markdown
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
        lazy = false,
		config = function()
			-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
			require("neodev").setup({})
			------------------------
			-- Then setup lspconfig:
			------------------------
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
            --lsp_doc_border = true
			-- LSP settings for lua
			lspconfig.lua_ls.setup({
				-- Disables annoying message that pops up for some reason
				settings = { Lua = { workspace = { checkThirdParty = "Disable" } } },
                capabilites = capabilities,
			})
			-- LSP settings for python
			lspconfig.jedi_language_server.setup({
                capabilites = capabilities,
			})
			-- LSP settings for FORTRAN
			lspconfig.fortls.setup({
                capabilites = capabilities,
                filetypes = { "fortran","f90"},
                root_dir = function ()
                    return vim.loop.cwd()
                end
			})
            --
            require('lspconfig.ui.windows').default_options = {
                border = "single"
            }
            vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
                vim.lsp.handlers.hover,
                {border = 'rounded'}
            )

            vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
                vim.lsp.handlers.signature_help,
                {border = 'rounded'}
            )
			-- Keymappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
