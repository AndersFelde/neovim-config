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
local keymap = vim.api.nvim_set_keymap

keymap("", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})

-- Resize window
keymap("n", "<M-j>", ":resize -2<CR>", {noremap = true})
keymap("n", "<M-k>", ":resize +2<CR>", {noremap = true})
keymap("n", "<M-h>", ":vertical resize -2<CR>", {noremap = true})
keymap("n", "<M-l>", ":vertical resize +2<CR>", {noremap = true})

-- Buffers
keymap("n", "<TAB>", ":BufferNext<CR>", {noremap = true})
keymap("n", "<S-TAB>", ":BufferPrevious<CR>", {noremap = true})
keymap("n", "<C-w>", ":BufferClose<CR>", {noremap = true})

-- tabbing
keymap("v", "<", "<gv", {noremap = true})
keymap("v", ">", ">gv", {noremap = true})
keymap("v", "<C-h>", "<gv", {noremap = true})
keymap("v", "<C-l>", ">gv", {noremap = true})

-- Window navigation

keymap("n", "<C-h>", "<C-w>h", {noremap = true})
keymap("n", "<C-j>", "<C-w>j", {noremap = true})
keymap("n", "<C-k>", "<C-w>k", {noremap = true})
keymap("n", "<C-l>", "<C-w>l", {noremap = true})

-- Text navigation
keymap("", "<S-h>", "b", {noremap = true})
keymap("", "<S-l>", "w", {noremap = true})
keymap("", "<S-j>", "5j", {noremap = true})
keymap("", "<S-k>", "5k", {noremap = true})

--Commenting
keymap("n", "<leader>c<leader>", "<Plug>kommentary_line_default", {})
keymap("v", "<leader>c<leader>", "<Plug>kommentary_visual_default", {})

--Trouble - diagnostics
keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xl", "<cmd>Trouble loclist<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xq", "<cmd>Trouble quickfix<cr>", {silent = true, noremap = true})
keymap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>", {silent = true, noremap = true})

-- WhichKey

-- Compe
keymap("i", "<C-CR>", "compe#complete()", {noremap = true, expr = true})
keymap("i", "<CR>", "compe#confirm('<CR>')", {noremap = true, expr = true})
keymap("i", "<C-e>", "compe#close('<C-e>')", {noremap = true, silent = true, expr = true})
keymap("i", "<C-f>", "compe#scroll({ 'delta': +4 })", {noremap = true, silent = true, expr = true})
keymap("i", "<C-d>", "compe#scroll({ 'delta': -4 })", {noremap = true, silent = true, expr = true})

keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {noremap = true})
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", {noremap = true})
keymap("n", "<leader>fc", "<cmd>Telescope command_history<CR>", {noremap = true})
keymap("n", "<leader>fh", "<cmd>Telescope oldfiles<CR>", {noremap = true})
keymap("n", "<leader>fb", "<cmd>Telescope marks<CR>", {noremap = true})

--Telescope-project
keymap(
    "n",
    "<leader>fp",
    "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<CR>",
    {noremap = true}
)

-- Session
keymap("n", "<Leader>ss", "<cmd>SessionSave<CR>", {noremap = true})
keymap("n", "<Leader>sl", "<cmd>SessionLoad<CR>", {noremap = true})

-- Symbols-outline
keymap("", "<C-m>", ":SymbolsOutline<CR>", {noremap = true})

--Todo
keymap("", "<leader>ft", "<cmd>TodoTelescope<CR>", {noremap = true})
keymap("", "<leader>xt", "<cmd>TodoTrouble<CR>", {noremap = true})

--Surround
-- BUG: Fixe surround ord
keymap("n", "sw", 'bysw"', {noremap = true})

--Goto-preview-definition
keymap("", "<leader>lPd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", {noremap = true})
keymap("", "<leader>lPi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", {noremap = true})
keymap("", "<leader>lPp", "<cmd>lua require('goto-preview').close_all_win()<CR>", {noremap = true})

--Diffview
keymap("", "<leader>Do", "<cmd>:DiffviewOpen<CR>", {noremap = true})
keymap("", "<leader>Dc", "<cmd>:DiffviewClose<CR>", {noremap = true})
keymap("", "<leader>Dr", "<cmd>:DiffviewRefresh<CR>", {noremap = true})

--DAP
keymap("", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", {noremap = true})
keymap("", "<leader>dl", "<cmd>lua require'dap'.list_breakpoints()<CR>", {noremap = true})
keymap("", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", {noremap = true})
keymap("", "<leader>do", "<cmd>lua require'dap'.step_over()<CR>", {noremap = true})
keymap("", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", {noremap = true})
keymap("", "<leader>ds", "<cmd>lua require'dap'.stop()<CR>", {noremap = true})
keymap("", "<leader>dd", "<cmd>lua require'dap'.disconnect()<CR>", {noremap = true})
keymap("", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", {noremap = true})
keymap("", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<CR>", {noremap = true})

--Terminal
keymap("", "<leader>t", "<cmd>Ttoggle<CR>", {noremap = true})
keymap("t", "<Esc>", "<C-\\><C-n>", {noremap = true})
