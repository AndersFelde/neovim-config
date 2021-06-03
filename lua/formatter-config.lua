--[[ require "format".setup {
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
} ]]
require("formatter").setup(
  {
    logging = true,
    filetype = {
      ["*"] = {
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
        -- luafmt
        function()
          return {
            exe = "black",
            args = {},
            stdin = false,
            tempfile_dir = "/tmp"
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
