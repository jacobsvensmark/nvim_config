return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        --local nvim_tree_api = require("nvim.api")
        dashboard.section.header.val = {
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
            [[                                                                       ]],
            [[                                                                       ]],
        }
        _Gopts = {
            position = "center",
            hl = "Type",
            -- wrap = "overflow";
        }
        local function footer()
            return "Not much to say, just start coding..."
        end
        dashboard.section.footer.val = footer()
        dashboard.opts.opts.noautocmd = true
        -- Set menu
        dashboard.section.buttons.val = {

            dashboard.button('n', '    New file', ':ene <BAR> startinsert<CR>'),
            dashboard.button('r', '    Recent files', ':Telescope oldfiles<CR>'),
            dashboard.button('o', '󰥨    Open file tree', ':NvimTreeOpen<CR>'),
            dashboard.button('f', '󰱼    Find text', ':Telescope live_grep<CR>'),
            dashboard.button('c', '󰐱    Configure plugins',':NvimTreeOpen<CR> <BAR> :lua require("nvim-tree.api").tree.change_root("~/.config/nvim")<CR>'),
            -- NvimTreeOpen:
            dashboard.button('l', '󰒲    Lazy', ':Lazy<CR>'),
            dashboard.button('m', '󱌣    Mason', ':Mason<CR>'),
            dashboard.button('p', '󰄉    Profile', ':Lazy profile<CR>'),
            dashboard.button('q', '󰭿    Quit', ':qa<CR>'),
        }
        alpha.setup(dashboard.opts)
    end,
}
