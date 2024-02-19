return {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        local scope = "focus"
        local indent = "passive"
        local hooks = require("ibl.hooks")
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "focus", { fg = "#7486bd" })
            vim.api.nvim_set_hl(0, "passive", { fg = "#41425e" })
        end)
        require("ibl").setup({
            indent = { highlight = indent },
            --            node_type = { fortran = { "MODULE", "SUBROUTINE", "PROGRAM", "LOOP" } },
            scope = {
                exclude = { language = { "lua", "python" } },
                highlight = scope,
                show_start = false
            },
            debounce = 100,
        })
        hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        local scope_lang = require "ibl.scope_languages"
        scope_lang.fortran = {
            -- works
            if_statement = true,
            where_statement = true,
            enum_statement = true,
            do_loop_statement = true,
            derived_type_definition = true,
            subroutine = true,
            module_procedure = true,
            interface = true,
        }
    end
}
