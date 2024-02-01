return {
    'Mofiqul/dracula.nvim',
    main = 'dracula',
    opts = {
        -- customize dracula color palette
        colors = {
          bg = "#282A36", --- same
          fg = "#F8F8F2", --- same
          selection = "#44475A", --- same
          comment = "#6272A4", --- same
          red = "#FF5555",
          orange = "#FFB86C", --- same
          yellow = "#F1FA8C", --- same
          green = "#50fa7b", --- same
          purple = "#BD93F9", --- same
          cyan = "#8BE9FD", --- same
          pink = "#FF79C6", --- same
          bright_red = "#FF6E6E", --- same
          bright_green = "#69FF94", --- same
          bright_yellow = "#FFFFA5", --- same
          bright_blue = "#D6ACFF", --- same
          bright_magenta = "#FF92DF", --- same
          bright_cyan = "#A4FFFF", --- same
          bright_white = "#FFFFFF",
          menu = "#21222C",
          visual = "#3E4452",
          gutter_fg = "#4B5263",
          nontext = "#3B4048",
          white = "#ABB2BF",
          black = "#191A21",
        },
        -- show the '~' characters after the end of buffers
        show_end_of_buffer = true, -- default false
        -- use transparent background
        transparent_bg = false, -- default false
        -- set custom lualine background color
        lualine_bg_color = "#44475a", -- default nil
        -- set italic comment
        italic_comment = true, -- default false
        -- overrides the default highlights with table see `:h synIDattr`
        overrides = {},
        -- You can use overrides as table like this
        -- overrides = {
        --   NonText = { fg = "white" }, -- set NonText fg to white
        --   NvimTreeIndentMarker = { link = "NonText" }, -- link to NonText highlight
        --   Nothing = {} -- clear highlight of Nothing
        -- },
        -- Or you can also use it like a function to get color from theme
        -- overrides = function (colors)
        --   return {
        --     NonText = { fg = colors.white }, -- set NonText fg to white of theme
        --   }
        -- end,
    },
    config = function(_,opts)
        require('dracula').setup(opts)
    --  vim.api.nvim_set_hl(0, 'TelescopeNormal', {bg='#3B4252'})
    --  vim.api.nvim_set_hl(0, 'TelescopeBorder', {bg='#3B4252'})
    end
}
