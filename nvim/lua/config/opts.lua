local opt = vim.opt
local NOCOL = 80

opt.wrap = true
opt.linebreak = true
opt.breakindent = true
-- opt.columns = NOCOL
-- Hard wrap
-- vim.opt.textwidth = NOCOL
opt.colorcolumn = NOCOL .. ""

opt.relativenumber = true

opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"

opt.updatetime = 250
opt.timeoutlen = 300

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.splitright = true
opt.showtabline = 2

opt.inccommand = "split"
opt.undofile = true
opt.sessionoptions:append("globals")
opt.sessionoptions:append("tabpages")

opt.clipboard = "unnamedplus"
