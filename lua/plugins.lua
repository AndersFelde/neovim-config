vim.cmd [[packadd packer.nvim]]

-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require("packer").startup(
    function(use)
        use "wbthomason/packer.nvim"

        --Colorscheme
        use "folke/tokyonight.nvim"
        use "kyazdani42/nvim-web-devicons" -- for file icons

        --Tree
        use "kyazdani42/nvim-tree.lua"
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
            "folke/trouble.nvim",
            requires = "kyazdani42/nvim-web-devicons",
            config = function()
                require("trouble").setup {}
            end
        }
        use "lukas-reineke/format.nvim"
        use "windwp/nvim-autopairs"
        use "p00f/nvim-ts-rainbow"

        --Comments
        use "b3nj5m1n/kommentary"

        --WhichKey
        use {
            "AckslD/nvim-whichkey-setup.lua",
            requires = {
                "liuchengxu/vim-which-key"
            }
        }
        -- use 'kosayoda/nvim-lightbulb'
        -- use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}
        use "nvim-treesitter/nvim-treesitter"

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
        use "yamatsum/nvim-cursorline"

        -- snippets
        use "hrsh7th/vim-vsnip"
        use "hrsh7th/vim-vsnip-integ"
        use "rafamadriz/friendly-snippets"

        -- git
        use {
            "lewis6991/gitsigns.nvim",
            requires = {
                "nvim-lua/plenary.nvim"
            },
            config = function()
                require("gitsigns").setup()
            end
        }

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
    end
)
