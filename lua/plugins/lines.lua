local wk = require("which-key")
wk.add({
  { mode = "n" },
  { "<leader>t", group = "Tab" },
  { "<leader>ta", ":$tabnew<CR>", desc = "New Tab" },
  { "<leader>tc", ":tabclose<CR>", desc = "Tab Close" },
  { "<leader>to", ":tabonly<CR>", desc = "Tab Only" },
  { "<leader>tn", ":tabn<CR>", desc = "Tab Next" },
  { "<leader>tp", ":tabp<CR>", desc = "Tab Previous" },
  { "<leader>tmp", ":-tabmove<CR>", desc = "Tab Move Previous" },
  { "<leader>tmn", ":+tabmove<CR>", desc = "Tab Move Next" },
})
return {
  {
    "nvim-lualine/lualine.nvim",
    config = function()
      require("lualine").setup()
    end,
  },
  {
    "nanozuki/tabby.nvim",
    ---@type TabbyConfig
    opts = {
      -- configs...
    },
  },
}
