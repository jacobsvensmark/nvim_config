return { "carbon-steel/detour.nvim",
    config = function ()
       vim.keymap.set('n', '<c-w><enter>', ":Detour<cr>")
       -- Launch plugin "detour" to create a pop-up
       vim.keymap.set('n', '<leader>t', function() require('detour').Detour() end)
   end
}
