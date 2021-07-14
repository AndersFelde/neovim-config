--String value	Help page	Affected modes	Vimscript equivalent
--'' (an empty string)	mapmode-nvo	Normal, Visual, Select, Operator-pending	:map
--'n'	mapmode-n	Normal	:nmap
--'v'	mapmode-v	Visual and Select	:vmap
--'s'	mapmode-s	Select	:smap
--'x'	mapmode-x	Visual	:xmap
--'o'	mapmode-o	Operator-pending	:omap
--'!'	mapmode-ic	Insert and Command-line	:map!
--'i'	mapmode-i	Insert	:imap
--'l'	mapmode-l	Insert, Command-line, Lang-Arg	:lmap
--'c'	mapmode-c	Command-line	:cmap
--'t'	mapmode-t	Terminal	:tmap
vim.api.nvim_set_keymap("", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- Resize window
vim.api.nvim_set_keymap("n", "<M-j>", ":resize -2<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-k>", ":resize +2<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-h>", ":vertical resize -2<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<M-l>", ":vertical resize +2<CR>", {noremap = true})

-- Buffers
vim.api.nvim_set_keymap("n", "<TAB>", ":BufferNext<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<S-TAB>", ":BufferPrevious<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-w>", ":BufferClose<CR>", {noremap = true})

-- tabbing
vim.api.nvim_set_keymap("v", "<", "<gv", {noremap = true})
vim.api.nvim_set_keymap("v", ">", ">gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<C-h>", "<gv", {noremap = true})
vim.api.nvim_set_keymap("v", "<C-l>", ">gv", {noremap = true})

-- Window navigation

vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", {noremap = true})
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", {noremap = true})
local a = vim.api

-- Text navigation
vim.api.nvim_set_keymap("", "<S-h>", "b", {noremap = true})
vim.api.nvim_set_keymap("", "<S-l>", "w", {noremap = true})
vim.api.nvim_set_keymap("", "<S-j>", "5j", {noremap = true})
vim.api.nvim_set_keymap("", "<S-k>", "5k", {noremap = true})

--Commenting
vim.api.nvim_set_keymap("n", "<leader>c<leader>", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("v", "<leader>c<leader>", "<Plug>kommentary_visual_default", {})

--Trouble - diagnostics
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap(
    "n",
    "<leader>xw",
    "<cmd>Trouble lsp_workspace_diagnostics<cr>",
    {silent = true, noremap = true}
)
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
vim.api.nvim_set_keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})
local t = "joe"
print(t)

-- WhichKey

-- Compe
vim.api.nvim_set_keymap("i", "<C-CR>", "compe#complete()", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
vim.api.nvim_set_keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Telescope
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope oldfiles<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope marks<CR>", {noremap = true})

--Telescope-project
vim.api.nvim_set_keymap(
    "n",
    "<leader>fp",
    "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
    {noremap = true}
)

-- Session
vim.api.nvim_set_keymap("n", "<Leader>ss", "<cmd>SessionSave<CR>", {noremap = true})
vim.api.nvim_set_keymap("n", "<Leader>sl", "<cmd>SessionLoad<CR>", {noremap = true})

-- Symbols-outline
vim.api.nvim_set_keymap("", "<C-m>", ":SymbolsOutline<CR>", {noremap = true})

--Todo
vim.api.nvim_set_keymap("", "<leader>ft", "<cmd>TodoTelescope<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<leader>xt", "<cmd>TodoTrouble<CR>", {noremap = true})

--Surround
-- BUG: Fixe surround ord
vim.api.nvim_set_keymap("n", "sw", 'bysw"', {noremap = true})

--Goto-preview-definition
vim.api.nvim_set_keymap(
    "",
    "<leader>lPd",
    "<cmd>lua require('goto-preview').goto_preview_definition()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap(
    "",
    "<leader>lPi",
    "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>",
    {noremap = true}
)
vim.api.nvim_set_keymap("", "<leader>lPp", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap = true})

--Diffview
vim.api.nvim_set_keymap("", "<leader>do", "<cmd>:DiffviewOpen<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<leader>dc", "<cmd>:DiffviewClose<CR>", {noremap = true})
vim.api.nvim_set_keymap("", "<leader>dr", "<cmd>:DiffviewRefresh<CR>", {noremap = true})
