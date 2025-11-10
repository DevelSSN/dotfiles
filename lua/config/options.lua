-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt
opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"

opt.updatetime = 250
opt.timeoutlen = 300

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.colorcolumn = "80"

opt.inccommand = "split"
