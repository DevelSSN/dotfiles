vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local lsp = vim.lsp

lsp.enable("lua_ls")
