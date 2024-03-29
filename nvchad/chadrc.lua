-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

-- 参考 https://github.com/siduck/dotfiles/tree/master/nvchad/custom

M.ui = {
   theme = "onedark",
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
            ["<leader>wv"] = {
                function()
                    vim.cmd("vs")
                end,
                "Split window right",
            },
            ["<leader>ws"] = {
                function()
                    vim.cmd("split")
                end,
                "Split window below",
            },
            ["<leader>wd"] = {
                function()
                    vim.cmd("close")
                end,
                "Close window",
            },
            ["<leader>wh"] = {
                function()
                    vim.cmd("wincmd h")
                end,
                "Focus window left",
            },
            ["<leader>wj"] = {
                function()
                    vim.cmd("wincmd j")
                end,
                "Focus window down",
            },
            ["<leader>wk"] = {
                function()
                    vim.cmd("wincmd k")
                end,
                "Focus window up",
            },
            ["<leader>wl"] = {
                function()
                    vim.cmd("wincmd l")
                end,
                "Focus window right",
            },
        }
    },
    lspconfig = {
        n = {
            ["gh"] = {
                function()
                    vim.lsp.buf.hover()
                end,
                "   lsp hover",
            }
        }
    },
}

M.plugins = {
   override = {
      ["kyazdani42/nvim-tree.lua"] = {},
      ["folke/which-key.nvim"] = function()
        local wk = require("which-key")
        wk.register({
            w = {
                name = "Windows management",
            }
        }, {
            prefix = "<leader>",
        }) 

        return {
            window = {
                border = "single",
            }
        }
      end
   },
   user = {
      ["neovim/nvim-lspconfig"] = {
        config = function()
            require "plugins.configs.lspconfig"
            require "custom.plugins.lspconfig"
            end,
        },
      ["folke/which-key.nvim"] = {
        disable = false,
      },
   }
}

return M
