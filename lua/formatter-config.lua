require("formatter").setup(
    {
        logging = true,
        filetype = {
            dockerfile = {
                function()
                    return {
                        exe = "sed -i 's/[ \t]*$//'",
                        stdin = true
                    }
                end
            },
            text = {
                function()
                    return {
                        exe = "sed -i 's/[ \t]*$//'",
                        stdin = true
                    }
                end
            },
            javascript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            typescript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            markdown = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            json = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
                        stdin = true
                    }
                end
            },
            html = {
                -- prettier
                function()
                    return {
                        exe = "html-beautify",
                        -- args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                        stdin = true
                    }
                end
            },
            htmldjango = {
                -- prettier
                function()
                    return {
                        exe = "html-beautify",
                        -- args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"},
                        stdin = true
                    }
                end
            },
            lua = {
                -- luafmt
                function()
                    return {
                        exe = "luafmt",
                        args = {"--stdin"},
                        stdin = true
                    }
                end
            },
            python = {
                -- Configuration for psf/black
                function()
                    return {
                        exe = "black", -- this should be available on your $PATH
                        args = {"-"},
                        stdin = true
                    }
                end
            },
            c = {
                -- clang
                function()
                    return {
                        exe = "clang-format",
                        args = {'-style="{BasedOnStyle: Google, UseTab: Never, IndentWidth: 4}"'},
                        stdin = true
                    }
                end
            },
            cpp = {
                -- clang
                function()
                    return {
                        exe = "clang-format",
                        args = {'-style="{BasedOnStyle: Google, UseTab: Never, IndentWidth: 4}"'},
                        stdin = true
                    }
                end
            }
        }
    }
)

--[[ vim.api.nvim_command("augroup Format")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufWritePost * FormatWrite")
vim.api.nvim_command("augroup END") ]]
vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END
]], true)
