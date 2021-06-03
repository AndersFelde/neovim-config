vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
vim.fn.sign_define("LightBulbSign", {text = "", texthl = "", linehl = "", numhl = ""})
