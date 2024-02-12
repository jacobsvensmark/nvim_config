return {
     "kevinhwang91/nvim-ufo",
     dependencies = "kevinhwang91/promise-async",
     event = "VeryLazy",
     main = "ufo",
     init = function()
       vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
       vim.o.foldcolumn = "1" -- '0' is not bad
       vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
       vim.o.foldlevelstart = 99
       vim.o.foldenable = true
     end,
     config = function()
       require("ufo").setup()

       provider_selector = function(bufnr, filetype, buftype)
           return {'treesitter', 'indent'}
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
