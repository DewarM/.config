return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async"
    },
    event = "BufReadPost",
    config = function()
        -- Global fold settings
        vim.o.foldcolumn = '1'
        vim.o.foldlevel = 99
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true

        -- Keymaps
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = "Open all folds" })
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = "Close all folds" })
        require('ufo').setup({
            open_fold_hl_timeout = 0,
            provider_selector = function(bufnr, filetype, buftype)
                return { 'lsp', 'indent' }
            end
        })
    end
}
