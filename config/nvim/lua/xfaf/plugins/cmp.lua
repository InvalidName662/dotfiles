return {
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                "hrsh7th/cmp-nvim-lsp",
                lazy = true,
            },
            {
                "hrsh7th/cmp-path",
                lazy = true,
            },
            {
                "hrsh7th/cmp-nvim-lua",
                lazy = true,
            },
            {
                "saadparwaiz1/cmp_luasnip",
                lazy = true
            }
        },
        config = function()
            local cmp = require("cmp")
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")

            cmp.setup {
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                -- Shamelessly stolen from the nvchad config
                window = {
                    completion = {
                        border = {
                            { "╭", "CmpBorder" },
                            { "─", "CmpBorder" },
                            { "╮", "CmpBorder" },
                            { "│", "CmpBorder" },
                            { "╯", "CmpBorder" },
                            { "─", "CmpBorder" },
                            { "╰", "CmpBorder" },
                            { "│", "CmpBorder" },
                        }
                    },
                    documentation = {
                        border = {
                            { "╭", "CmpDocBorder" },
                            { "─", "CmpDocBorder" },
                            { "╮", "CmpDocBorder" },
                            { "│", "CmpDocBorder" },
                            { "╯", "CmpDocBorder" },
                            { "─", "CmpDocBorder" },
                            { "╰", "CmpDocBorder" },
                            { "│", "CmpDocBorder" },
                        },
                        winhighlight = "Normal:CmpDoc",
                    },
                },
                mapping = {
                    ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item()),
                    ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item()),
                    ["<C-s>"] = cmp.mapping(cmp.mapping.scroll_docs(4)),
                    ["<C-w>"] = cmp.mapping(cmp.mapping.scroll_docs(-4)),
                    ["<C-Space>"] = function()
                        if cmp.visible() then
                            cmp.confirm()
                        else
                            cmp.complete()
                        end
                    end,
                    ["<CR>"] = cmp.mapping.confirm {},
                    -- Shamelessly stolen from the nvchad config
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif require("luasnip").expand_or_jumpable() then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
                                ""
                            )
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif require("luasnip").jumpable(-1) then
                            vim.fn.feedkeys(
                                vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true),
                                ""
                            )
                        else
                            fallback()
                        end
                    end, {
                        "i",
                        "s",
                    })
                },
                sources = cmp.config.sources({
                    { name = "luasnip", priority = 100 },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "crates" },
                    { name = "nvim_lua" },
                }),
            }

            cmp.event:on(
                'confirm_done',
                cmp_autopairs.on_confirm_done {
                    filetypes = {
                        tex = false,
                        plaintex = false,
                    }
                }
            )
        end
    },
    -- cmp sources
    {
        "saecki/crates.nvim",
        tag = 'v0.3.0',
        dependencies = "nvim-lua/plenary.nvim",
        config = true,
        event = "BufEnter Cargo.toml",
    }
}
