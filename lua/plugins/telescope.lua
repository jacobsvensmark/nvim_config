return {
    {
        'nvim-telescope/telescope.nvim', version = "0.1.5",
        dependencies = {'nvim-lua/plenary.nvim'},
        config = function ()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', builtin.find_files, {}) -- Find filename of all files in project folder
            vim.keymap.set('n', '<leader>pg',builtin.live_grep, {}) -- Grep through files in project
            vim.keymap.set('n', '<leader>gi', builtin.git_files, {}) -- Find filename of git files in project folder
--          vim.keymap.set('n', '<leader>ps', function()
--              builtin.grep_string({ search = vim.fn.input("Grep > ") })   
--          end)
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    },
}
