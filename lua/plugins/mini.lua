local wk = require("which-key")
wk.add({
  { mode = "n" },
  { "<leader>s", group = "Surround" },
})
return {
  {
    "nvim-mini/mini.icons",
    config = function()
      require("mini.icons").setup()
    end,
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    "nvim-mini/mini.move",
    version = false,
  },
  {
    "nvim-mini/mini.surround",
    version = false,
    config = function()
      require("mini.surround").setup({
        mappings = {
          add = "<leader>sa", -- Add surrounding in Normal and Visual modes
          delete = "<leader>sd", -- Delete surrounding
          find = "<leader>sf", -- Find surrounding (to the right)
          find_left = "<leader>sF", -- Find surrounding (to the left)
          highlight = "<leader>sh", -- Highlight surrounding
          replace = "<leader>sr", -- Replace surrounding

          suffix_last = "", -- Suffix to search with "prev" method
          suffix_next = "", -- Suffix to search with "next" method
        },
      })
    end,
  },
}
