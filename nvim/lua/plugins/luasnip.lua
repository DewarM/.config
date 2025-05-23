return {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    lazy = true,
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function(_, opts)
        if opts then require("luasnip").config.setup(opts) end
        require('luasnip.loaders.from_vscode').lazy_load()
        -- friendly-snippets - enable standardized comments snippets
        -- https://github.com/rafamadriz/friendly-snippets/wiki
        require("luasnip").filetype_extend("typescript", { "tsdoc" })
        require("luasnip").filetype_extend("javascript", { "jsdoc" })
        -- require("luasnip").filetype_extend("lua", { "luadoc" })
        -- require("luasnip").filetype_extend("python", { "pydoc" })
        -- require("luasnip").filetype_extend("rust", { "rustdoc" })
        -- require("luasnip").filetype_extend("cs", { "csharpdoc" })
        -- require("luasnip").filetype_extend("java", { "javadoc" })
        -- require("luasnip").filetype_extend("c", { "cdoc" })
        -- require("luasnip").filetype_extend("cpp", { "cppdoc" })
        -- require("luasnip").filetype_extend("php", { "phpdoc" })
        -- require("luasnip").filetype_extend("kotlin", { "kdoc" })
        -- require("luasnip").filetype_extend("ruby", { "rdoc" })
        -- require("luasnip").filetype_extend("sh", { "shelldoc" })
    end,
}
