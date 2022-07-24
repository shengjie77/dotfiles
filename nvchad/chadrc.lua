-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyodark",
}

M.mappings = {
    general = {
        n = {
            ["<A-p>"] = {
                function()
                    vim.cmd("WhichKey <leader>")
                end,
                "Open WhichKey Menu",
            },
        },
    },
    nvterm = {
        t = {
            ["<A-p>"] = {
                function()
                    vim.cmd("WhichKey <leader>")
                end,
                "Open WhichKey Menu",
            },
        },
    },
    whichkey = {
        n = {
            ["<leader>we"] = {
                function()
                    vim.cmd("NvimTreeToggle")
                end,
                "Toggle file explorer",
            },
        }
    },
    groups = {
        n = {
            ["<leader>"] = {
                w = { name = "Windows management" },
            }
        },
    },
}

M.plugins = {
   override = {
      ["kyazdani42/nvim-tree.lua"] = {},
      ["folke/which-key.nvim"] = {
        window = {
            border = "single",
        },
      },
   }
}

return M
