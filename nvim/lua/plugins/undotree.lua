return {
    "mbbill/undotree",
    keys = {
        { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
    init = function()
        -- Optional: Open undotree in a vertical split and focus it
        vim.g.undotree_WindowLayout = 2
        -- Optional: Highlight changes
        vim.g.undotree_HighlightChangedText = 1
        vim.g.undotree_HighlightChangedWithSign = 1
        -- Optional: Auto-focus when opening
        vim.g.undotree_SetFocusWhenToggle = 1
        vim.keymap.set('n', '<leader><F5>', vim.cmd.UndotreeToggle)
    end,
}
