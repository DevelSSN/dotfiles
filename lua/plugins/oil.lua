local wk = require("which-key")

wk.add({
  { mode = "n" },
  { "<leader>f", group = "file" },
  { "-", "<CMD>Oil --float<CR>", desc = "Open parent directory" },
  { "<leader>ff", "<CMD>Oil<CR>", desc = "Oil File Manager" },
  { "<leader>fs", "<CMD>SCReenkey toggle<CR>", desc = "Screenkey toggle" },
})
return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {

      win_options = {
        signcolumn = "yes:2",
      },
      watch_for_changes = true,
    },
    lazy = false,
  },

  {
    "refractalize/oil-git-status.nvim",
    config = true,
  },
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    opts = {},
  },
}
