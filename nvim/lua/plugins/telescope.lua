return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    cmd = "Telescope",
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { "nvim-telescope/telescope-live-grep-args.nvim" },
        { 'nvim-telescope/telescope-fzf-native.nvim',    build = 'make' }
    },
    keys = {
        { '<leader>fh' },
        { '<leader>pf' },
        { '<leader>fg' },
    },
    config = function()
        local telescope = require("telescope")
        local telescopeConfig = require("telescope.config")

        -- Clone the default Telescope configuration
        local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

        -- I want to search in hidden/dot files.
        table.insert(vimgrep_arguments, "--hidden")
        -- I don't want to search in the `.git` directory.
        table.insert(vimgrep_arguments, "--glob")
        table.insert(vimgrep_arguments, "!**/.git/*")
        -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#file-and-text-search-in-hidden-files-and-directories
        telescope.setup({
            defaults = {
                -- `hidden = true` is not supported in text grep commands.
                vimgrep_arguments = vimgrep_arguments,
            },
            pickers = {
                find_files = {
                    -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
                    find_command = { "fd", "--hidden", "--exclude", "**/.git/*" },
                },
            },
        })

        -- load live grep extension
        telescope.load_extension("live_grep_args")

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args,
            { desc = 'Telescope live grep' })
    end

}
