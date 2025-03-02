return {
    "airblade/vim-gitgutter",
    event = "BufReadPre", -- Load when opening a file
    config = function()
        vim.opt.updatetime = 100
        vim.opt.signcolumn = "yes"
    end
}
