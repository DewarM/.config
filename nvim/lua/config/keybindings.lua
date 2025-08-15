-- Quickfix keymaps
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
-- Custom keymap: <leader>cc resolves the git conflict under the cursor by choosing "ours", "theirs", or "base" depending on the highlighted section
vim.keymap.set('n', '<leader>cc', function()
    local actions = {
        GitConflictCurrent = 'ours',
        GitConflictCurrentLabel = 'ours',
        GitConflictAncestor = 'base',
        GitConflictAncestorLabel = 'base',
        GitConflictIncoming = 'theirs',
        GitConflictIncomingLabel = 'theirs',
    }
    local mark = vim.iter(vim.inspect_pos().extmarks):find(function(e)
        return e.ns == 'git-conflict' and actions[e.opts.hl_group]
    end)
    if not mark then
        vim.notify('No conflict under cursor', vim.log.levels.WARN)
        return
    end
    require('git-conflict').choose(actions[mark.opts.hl_group])
end)
