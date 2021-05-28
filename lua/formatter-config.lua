require "format".setup {
    ["*"] = {
        {
            cmd = {
                "sed -i 's/[ \t]*$//'"
            }
        } -- remove trailing whitespace
    },
    vim = {
        {
            cmd = {
                "luafmt -w replace"
            },
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    lua = {
        {
            cmd = {
                "luafmt -w replace"
            }
            --[[ cmd = {
                function(file)
                    return string.format("luafmt -l %s -w replace %s", vim.bo.textwidth, file)
                end
            } ]]
        }
    },
    javascript = {
        {
            cmd = {
                "prettier -w"
            }
        }
    },
    python = {
        {
            cmd = {
                "black"
            }
        }
    },
    markdown = {
        {
            cmd = {
                "prettier -w"
            }
        },
        {
            cmd = {
                "black"
            },
            start_pattern = "^```python$",
            end_pattern = "^```$",
            target = "current"
        }
    },
    html = {
        {
            cmd = {
                "prettier -w"
            }
        }
    },
    htmldjango = {
        {
            cmd = {
                "html-beautify -r"
            }
        }
    },
    json = {
        {
            cmd = {
                "prettier -w"
            }
        }
    }
}

vim.api.nvim_command("augroup Format")
vim.api.nvim_command("autocmd!")
vim.api.nvim_command("autocmd BufWritePost * FormatWrite")
vim.api.nvim_command("augroup END")
