local wk = require("which-key")
wk.add({
  { mode = "n" },
  { "<leader>g", group = "Git" },
  { "<leader>gg", "<CMD>Git<CR>", desc = "Fugitive" },
  { "<leader>gh", "<CMD>Gitsigns preview_hunk_inline<CR>", desc = "Preview Hunk" },
  { "<leader>ghs", "<CMD>Gitsigns stage_hunk<CR>", desc = "Stage Hunk" },
  { "<leader>ghu", "<CMD>Gitsigns undo_stage_hunk<CR>", desc = "Stage Hunk" },
})
return {
  {
    "tpope/vim-fugitive",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
}
