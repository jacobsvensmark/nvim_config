-- require('jsv_preferences')
-- This file can be loaded by calling `lua require('plugins')` from your init.vim
--
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
-- Must be here before the rest (says lazy plugin manager)
vim.g.mapleader = " "
-- Must be before plugins (says nvim-colorize)
vim.opt.termguicolors = true
require("lazy").setup("plugins")
require("jsv_preferences")
-- Stuff that needed to be here and not in plugin config files for various reasons:
vim.cmd.colorscheme 'dracula' -- Must be done after plugins
-- Other color stuff that needs to be 
vim.api.nvim_set_hl(0, 'FloatBorder', {bg="#282A36", fg='#F8F8F2'})
vim.api.nvim_set_hl(0, 'NormalFloat', {bg="#282A36"})
-- Disables semantic token highligting by the LSP because it's kinda slow
vim.api.nvim_create_autocmd("LspAttach", {
callback = function(args)
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  client.server_capabilities.semanticTokensProvider = nil
end,
})
