vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local lsp = vim.lsp

require("config.lsp.luals")
require("config.lualine")
