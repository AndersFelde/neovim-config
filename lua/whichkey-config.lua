local wk = require("which-key")

wk.register(
    {
        ["<leader>f"] = {
            name = "+file",
            p = {"<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>"}
        },
        ["<leader>c"] = {
            name = "+comment"
        },
        ["<leader>h"] = {
            name = "+GitSigns"
        },
        ["<leader>s"] = {
            name = "+session"
        },
        ["<leader>w"] = {
            name = "+workspace"
        },
        ["<leader>l"] = {
            name = "+LSP"
        },
        ["<leader>x"] = {
            name = "+trouble"
        }
    }
)
