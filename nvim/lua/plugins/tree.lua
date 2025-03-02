return {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
    },
    cmd = "NvimTreeOpen",
    init = function()
        -- FIX: use `autocmd` for lazy-loading nvim-tree instead of directly requiring it,
        -- because `cwd` is not set up properly.
        --
        print("helloo")
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("Nvim-tree_start_directory", { clear = true }),
            desc = "Start nvim-tree with directory",
            once = true,
            callback = function()
                print("callback")
                if package.loaded["nvim-tree"] then
                    return
                else
                    local stats = vim.uv.fs_stat(vim.fn.argv(0))
                    if stats and stats.type == "directory" then
                        require("nvim-tree").open_on_directory()
                    end
                end
            end,
        })
    end,
    opts = {
        actions = {
            open_file = {
                quit_on_open = true,
            },
        },
    },
    keys = {
        { "<leader>ff", vim.cmd.NvimTreeFindFile },
        { "<leader>pv", vim.cmd.NvimTreeFocus },
    },
    config = function(_, opts)
        require("nvim-tree").setup(opts)
    end
}
