vim.env.PATH = vim.fn.stdpath("data") .. "/mason/bin:" .. vim.env.PATH

local lsp = vim.lsp

require("mini.move").setup()
require("mini.surround").setup()
