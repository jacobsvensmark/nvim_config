return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      auto_install = true,
      ensure_installed = {"python","fortran","c", "lua","vimdoc","vim"},
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      },
      indent = {
        enable = true,
      },
      ignore_install = {},   -- LSP diagnostic complains if I
      modules = {},          -- dont set these variables,
      sync_install = false,  -- just ignore them
    })
  end
}
