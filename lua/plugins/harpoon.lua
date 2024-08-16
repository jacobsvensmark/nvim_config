return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = function()
      local harpoon = require 'harpoon'
      return {
        { '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, },
        { '<leader>ha', function() harpoon:list():add() end, desc = 'Harpoon Add file', },
        { '<C-m>', function() harpoon:list():next() end, desc = 'Harpoon Prev', },
        { '<C-n>', function() harpoon:list():prev() end, desc = 'Harpoon Next', },
      }
    end,
    config = function()
      require("harpoon"):setup()
    end
    }
