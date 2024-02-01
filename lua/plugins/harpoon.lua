return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        --local mark = require("harpoon.mark")
        --local ui = require("harpoon.ui")

        --vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
        --vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
        vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end) 

        vim.keymap.set("n", "<C-m>", function() ui.nav_next() end)
        vim.keymap.set("n", "<C-n>", function() ui.nav_prev() end)
    end
    }
