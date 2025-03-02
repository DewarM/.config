return {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("tokyonight").setup({
            -- use the storm style
            style = "storm",
            on_highlights = function(highlights, colors)
                highlights.LineNr = {
                    fg = colors.cyan
                }
                highlights.LineNrAbove = {
                    fg = colors.cyan
                }
                highlights.LineNrBelow = {
                    fg = colors.cyan
                }
            end
        })
        vim.cmd([[colorscheme tokyonight-storm]])
    end,
}
