-- NOTE: https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#ccrust-via-vscode-cpptools

local dap = require "dap"

-- C/C++
-- NOTE: Spesielt install dir for vscode-cpptools
dap.adapters.cpptools = {
    type = "executable",
    command = "/home/kippster/.local/share/nvim/vscode-cpptools/extension/debugAdapters/OpenDebugAD7"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "cpptools",
        request = "launch",
        --[[ program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end, ]]
        program = "${fileDirname}/${fileBasenameNoExtension}.c",
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        MIMode = "gdb",
        miDebuggerPath = "/usr/bin/gdb"
    }
}

dap.configurations.c = dap.configurations.cpp --Reuse for c

--Python
local python_location = "/usr/bin/python3"
dap.adapters.python = {
    type = "executable",
    command = python_location,
    args = {"-m", "debugpy.adapter"}
}

dap.configurations.python = {
    {
        -- The first three options are required by nvim-dap
        type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch file",
        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

        program = "${file}", -- This configuration will launch the current file if used.
        pythonPath = function()
            return python_location
            -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
            -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
            -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
            --[[ local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
                return cwd .. "/venv/bin/python"
            elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
                return cwd .. "/.venv/bin/python"
            else
                return "/usr/bin/python"
            end ]]
        end
    }
}
