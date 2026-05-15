return {
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  {
    "nvim-mini/mini.icons",
    opts = {},
  },
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "nvim-mini/mini.move", version = false },
  { "nvim-mini/mini.surround", version = false },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "romus204/tree-sitter-manager.nvim",
    dependencies = {},
    config = function()
      require("tree-sitter-manager").setup({})
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "NStefan002/screenkey.nvim",
    lazy = false,
    version = "*",
    opts = {},
  },
}
