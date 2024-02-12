return {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    event = "VeryLazy",
    main = "ufo",
    init = function()
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99  -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
    end,
    config = function()
        require("ufo").setup()
        -- The below is suposed to have treesitter provide folding info
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
        --vim.opt.foldmethod = "expr"
        --vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        provider_selector = function(bufnr, filetype, buftype)
            return { 'treesitter', 'indent' }
        end
        vim.keymap.set("n", "zR", require("ufo").openAllFolds)
        vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
        vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds)
        vim.keymap.set("n", "K", function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                -- vim.lsp.buf.hover()
                vim.cmd [[ Lspsaga hover_doc ]]
            end
        end)
    end,
}

-- Vim folding commands
-- ---------------------------------
-- zf#j creates a fold from the cursor down # lines.
-- zf/ string creates a fold from the cursor to string .
-- zj moves the cursor to the next fold.
-- zk moves the cursor to the previous fold.
-- za toggle a fold at the cursor.
-- zo opens a fold at the cursor.
-- zO opens all folds at the cursor.
-- zc closes a fold under cursor. 
-- zm increases the foldlevel by one.
-- zM closes all open folds.
-- zr decreases the foldlevel by one.
-- zR decreases the foldlevel to zero -- all folds will be open.
-- zd deletes the fold at the cursor.
-- zE deletes all folds.
-- [z move to start of open fold.
-- ]z move to end of open fold.
