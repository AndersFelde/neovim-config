vim.cmd [[packadd packer.nvim]]

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        --Colorscheme
        use "mhartington/oceanic-next"
        use "folke/tokyonight.nvim"
        -- use "marko-cerovac/material.nvim"
        use "kyazdani42/nvim-web-devicons" -- for file icons

        --Tree
        use {
            "kyazdani42/nvim-tree.lua"
            -- commit = "fd7f60e242205ea9efc9649101c81a07d5f458bb"
        }
        use {
            "hoob3rt/lualine.nvim",
            requires = {
                "kyazdani42/nvim-web-devicons",
                opt = true
            }
        }

        -- Bar
        use "romgrk/barbar.nvim"

        --LSP
        use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }

        use {
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons"
        }
        use "mhartington/formatter.nvim"
        use "windwp/nvim-autopairs"
        use "p00f/nvim-ts-rainbow"
        use {
            "RishabhRD/nvim-lsputils",
            requires = "RishabhRD/popfix"
        }
        use "onsails/lspkind-nvim"
        use "simrat39/symbols-outline.nvim"
        use "ray-x/lsp_signature.nvim"
        use "kosayoda/nvim-lightbulb"
        use {
            "rmagatti/goto-preview",
            config = function()
                require("goto-preview").setup {}
            end
        }

        -- use "glepnir/lspsaga.nvim"
        -- use 'kosayoda/nvim-lightbulb'
        -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
        -- use "lukas-reineke/format.nvim"

        --Comments
        use "b3nj5m1n/kommentary"

        --WhichKey
        use {
            "folke/which-key.nvim",
            config = function()
                require("which-key").setup {}
            end
        }

        --Cursor highlight
        use "yamatsum/nvim-cursorline"

        -- completion
        use "hrsh7th/nvim-compe"

        --colorizer
        use {
            "norcalli/nvim-colorizer.lua",
            config = function()
                require("colorizer").setup()
            end
        }

        --Highlight same words and line
        -- use "yamatsum/nvim-cursorline"

        -- snippets
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/vim-vsnip-integ"
        use "rafamadriz/friendly-snippets"

        -- git
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            }
        }
        use {
            "TimUntersberger/neogit",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("neogit").setup {
                    integrations = {
                        diffview = true
                    }
                }
            end
        }
        use "sindrets/diffview.nvim"

        --Dashboard
        use {
            "glepnir/dashboard-nvim",
            config = function()
                vim.cmd("let g:dashboard_default_executive ='telescope'")
            end
        }

        --Telescope
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim"
            }
        }
        -- NOTE: w for å velge directory
        use {
            "nvim-telescope/telescope-project.nvim",
            config = function()
                require "telescope".load_extension("project")
            end
        }

        --Todo
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end
        }

        --Surround
        -- NOTE: visually select s<char> or press ys{motion}{char}
        -- NOTE: sr<from><to>, sd<char>

        use {
            "blackCauldron7/surround.nvim",
            config = function()
                require "surround".setup {}
            end
        }

        --Reload
        -- NOTE: :Reload
        use "famiu/nvim-reload"
    end
)
