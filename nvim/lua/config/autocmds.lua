local autocmd = vim.api.nvim_create_autocmd
autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup("lsp", { clear = true }),
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.api.nvim_create_autocmd("BufWritePre", {
            -- 3
            buffer = args.buf,
            callback = function()
                -- 4 + 5
                vim.lsp.buf.format { async = false }
            end,
        })
    end
})
autocmd('BufEnter', {
    group = vim.api.nvim_create_augroup("ai", { clear = true }),
    callback = function(args)
        local buf_type = vim.api.nvim_buf_get_option(args.buf, 'buftype')
        if buf_type == "" then
            local chat = require("CopilotChat")
            vim.keymap.set({ 'n' }, '<leader>ap', chat.select_prompt, { desc = 'AI Prompt' })
            vim.keymap.set({ 'n' }, '<leader>aa', chat.open, { desc = 'AI Open' })
        end
    end
})
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if vim.opt.foldmethod:get() == "expr" then
            vim.schedule(function()
                vim.opt.foldmethod = "expr"
            end)
        end
    end,
})
