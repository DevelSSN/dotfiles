local theme = {
  fill = "TabbyFill",
  head = "TabbyHead",
  current_tab = "TabbyCurrent",
  tab = "TabbyTab",
  win = "TabbyWin",
  tail = "TabbyTail",
}

local tabline = {
  line = function(line)
    return {
      {
        { "  ", hl = theme.head },
        margin = " ",
      },

      line.tabs().foreach(function(tab)
        local hl = tab.is_current() and theme.current_tab or theme.tab

        return {
          { "[", hl = hl },

          {
            tab.is_current() and "  " or "  ",
            hl = hl,
          },

          {
            tab.number(),
            hl = hl,
          },

          {
            tab.is_current() and (" " .. tab.name() .. " ") or "",
            hl = hl,
          },

          { "]", hl = hl },
        }
      end),

      line.spacer(),

      hl = theme.fill,
    }
  end,
}

local statusline = {}
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
      require("lualine").setup(statusline)
    end,
  },
  {
    "nanozuki/tabby.nvim",
    ---@type TabbyConfig
    -- opts = tabline,
    opts = {
      preset = "active_wins_at_tail",
      option = {
        lualine_theme = "gruvbox", -- Uses the active lualine theme colors
        nerdfont = true,
      },
    },
    lazy = false,
  },
}
