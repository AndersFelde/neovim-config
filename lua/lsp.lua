local on_attach = function(client, bufnr)
    -- Mappings.
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local opts = {noremap = true, silent = true}

    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<leader>lD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "<leader>ld", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "<leader>lt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<leader>lc", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "<leader>lR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "<space>le", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<leader>ln", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>lp", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

    --Lsp signature
    require "lsp_signature".on_attach()
end

-- LspInstall
--[[ local function setup_servers()
    require "lspinstall".setup()
    local servers = require "lspinstall".installed_servers()
    for _, server in pairs(servers) do
        if server == "lua" then
            require "lspconfig"[server].setup {
                on_attach = on_attach,
            }
        else
            require "lspconfig"[server].setup {on_attach = on_attach}
        end
    end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require "lspinstall".post_install_hook = function()
    setup_servers()
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end ]]
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
lsp_installer.on_server_ready(
    function(server)
        local opts = {
            on_attach = on_attach,
            capabilities = capabilities
        }

        -- (optional) Customize the options passed to the server
        if server.name == "sumneko_lua" then
            opts = {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            -- Get the language server to recognize the `vim` global
                            globals = {"vim"}
                        }
                    }
                }
            }
        end

        -- This setup() function is exactly the same as lspconfig's setup function.
        -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        server:setup(opts)
    end
)
--LSPINSTALL
--[[ local lsp_installer_servers = require'nvim-lsp-installer.servers'

local server_available, requested_server = lsp_installer_servers.get_server("rust_analyzer")
if server_available then
    requested_server:on_ready(function ()
        local opts = {}

        requested_server:setup(opts)
    end)
    if not requested_server:is_installed() then
        -- Queue the server to be installed
        requested_server:install()
    end
end ]]
--[[ -- compe
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits"
    }
} ]]
--lsp-utils
vim.lsp.handlers["textDocument/codeAction"] = require "lsputil.codeAction".code_action_handler
vim.lsp.handlers["textDocument/references"] = require "lsputil.locations".references_handler
vim.lsp.handlers["textDocument/definition"] = require "lsputil.locations".definition_handler
vim.lsp.handlers["textDocument/declaration"] = require "lsputil.locations".declaration_handler
vim.lsp.handlers["textDocument/typeDefinition"] = require "lsputil.locations".typeDefinition_handler
vim.lsp.handlers["textDocument/implementation"] = require "lsputil.locations".implementation_handler
vim.lsp.handlers["textDocument/documentSymbol"] = require "lsputil.symbols".document_handler
vim.lsp.handlers["workspace/symbol"] = require "lsputil.symbols".workspace_handler

--Diagnostics custom
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        virtual_text = {
            prefix = " ",
            spacing = 4
        },
        signs = true,
        update_in_insert = false
    }
)
-- vim.lsp.diagnostic.set_signs("LspDiagnosticsSignError", {priority = 20})
vim.fn.sign_define("LspDiagnosticsSignError", {text = " ", texthl = "LspDiagnosticsDefaultError"})
vim.fn.sign_define("LspDiagnosticsSignWarning", {text = " ", texthl = "LspDiagnosticsDefaultWarning"})
vim.fn.sign_define("LspDiagnosticsSignInformation", {text = " ", texthl = "LspDiagnosticsDefaultInformation"})
vim.fn.sign_define("LspDiagnosticsSignHint", {text = "ﴞ ", texthl = "LspDiagnosticsDefaultHint"})
