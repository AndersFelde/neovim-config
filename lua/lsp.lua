require "lspinstall".setup() -- important

local servers = require "lspinstall".installed_servers()
for _, server in pairs(servers) do
    require "lspconfig"[server].setup {}
end

-- compe
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits"
    }
}

--Format on save
vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
