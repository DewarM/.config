return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "zbirenbaum/copilot.lua" },                   -- or zbirenbaum/copilot.lua
            { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        tag = "v3.12.2",
        enabled = true,
        lazy = true,
        build = "make tiktoken", -- Only on MacOS or Linux

        config = function()
            local chat = require('CopilotChat')
            chat.setup {
                mappings = {
                    reset = {
                        normal = '',
                        insert = '',
                    },
                },
                -- See Configuration section for options
                --
            }
        end,
        -- See Commands section for default commands if you want to lazy load on them

    },
}
