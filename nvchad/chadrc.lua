-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
   theme = "tokyodark",
}

M.mappings = {
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

return M
