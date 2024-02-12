return {
    'romgrk/barbar.nvim',
    dependencies = {
        --'lewis6991/gitsigns.nvim',   -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    config = function(_,opts)
        require("barbar").setup(opts)
        -- Move to previous/next
        local map = vim.api.nvim_set_keymap
        local options = { noremap = true, silent = true }
        map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', options)
        map('n', '<A-.>', '<Cmd>BufferNext<CR>', options)
        -- Re-order to previous/next
        map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', options)
        map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', options)
    end

}
