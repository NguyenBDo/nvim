-- PATH: nvim/lua/plugins/completions.lua

return {
    { -- https://github.com/hrsh7th/cmp-nvim-lsp
        "hrsh7th/cmp-nvim-lsp",
    },
    { -- https://github.com/L3MON4D3/LuaSnip
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip", -- https://github.com/saadparwaiz1/cmp_luasnip
            "rafamadriz/friendly-snippets", -- https://github.com/rafamadriz/friendly-snippets
        },
    },
    { -- https://github.com/hrsh7th/nvim-cmp
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")
            require("luasnip.loaders.from_vscode").lazy_load()
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                }, {
                    { name = "buffer" },
                }),
            })
        end,
    },
}
