-- Color table for highlights
local colors = {
  bg = vim.g.terminal_color_0 or "#202328",
  fg = vim.g.terminal_color_7 or "#bbc2cf",
  yellow = vim.g.terminal_color_3 or "#ECBE7B",
  cyan = vim.g.terminal_color_6 or "#008080",
  darkblue = "#081633",
  green = vim.g.terminal_color_2 or "#98be65",
  orange = vim.g.terminal_color_1 or "#FF8800",
  violet = vim.g.terminal_color_5 or "#a9a1e1",
  magenta = vim.g.terminal_color_5 or "#c678dd",
  blue = vim.g.terminal_color_4 or "#51afef",
  red = vim.g.terminal_color_1 or "#ec5f67",
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand("%:p:h")
    local gitdir = vim.fn.finddir(".git", filepath .. ";")
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local statusline = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    -- These will be filled later
    lualine_c = {
      {
        function()
          return "▊"
        end,
        color = { fg = colors.blue }, -- Sets highlighting of component
        padding = { left = 0, right = 1 }, -- We don't need space before this
      },
      {
        -- mode component
        function()
          return ""
        end,
        color = function()
          -- auto change color according to neovims mode
          local mode_color = {
            n = colors.red,
            i = colors.green,
            v = colors.blue,
            [""] = colors.blue,
            V = colors.blue,
            c = colors.magenta,
            no = colors.red,
            s = colors.orange,
            S = colors.orange,
            [""] = colors.orange,
            ic = colors.yellow,
            R = colors.violet,
            Rv = colors.violet,
            cv = colors.red,
            ce = colors.red,
            r = colors.cyan,
            rm = colors.cyan,
            ["r?"] = colors.cyan,
            ["!"] = colors.red,
            t = colors.red,
          }
          local color = mode_color[vim.fn.mode()]
          return { fg = color or colors.red }
        end,
        padding = { right = 1 },
      },
      {
        -- filesize component
        "filesize",
        cond = conditions.buffer_not_empty,
      },
      {
        "filename",
        cond = conditions.buffer_not_empty,
        color = { fg = colors.magenta, gui = "bold" },
      },
      { "location" },
      { "progress", color = { fg = colors.fg, gui = "bold" } },
      {
        "diagnostics",
        sources = { "nvim_diagnostic" },
        symbols = { error = " ", warn = " ", info = " " },
        diagnostics_color = {
          error = { fg = colors.red },
          warn = { fg = colors.yellow },
          info = { fg = colors.cyan },
        },
      },
      {
        function()
          return "%="
        end,
      },
      {
        -- Lsp server name .
        function()
          local msg = "No Active Lsp"
          local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
          local clients = vim.lsp.get_clients({ bufnr = 0 })
          if next(clients) == nil then
            return msg
          end
          for _, client in ipairs(clients) do
            local filetypes = client.config.filetypes
            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
              return client.name
            end
          end
          return msg
        end,
        icon = " LSP:",
        color = { fg = "#ffffff", gui = "bold" },
      },
    },
    lualine_x = {
      {
        "o:encoding", -- option component same as &encoding in viml
        fmt = string.upper, -- I'm not sure why it's upper case either ;)
        cond = conditions.hide_in_width,
        color = { fg = colors.green, gui = "bold" },
      },
      {
        "fileformat",
        fmt = string.upper,
        icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
        color = { fg = colors.green, gui = "bold" },
      },
      {
        "branch",
        icon = "",
        color = { fg = colors.violet, gui = "bold" },
        cond = conditions.check_git_workspace,
      },
      {
        "diff",
        -- Is it me or the symbol for modified us really weird
        symbols = { added = " ", modified = "󰝤 ", removed = " " },
        diff_color = {
          added = { fg = colors.green },
          modified = { fg = colors.orange },
          removed = { fg = colors.red },
        },
        cond = conditions.hide_in_width,
      },
      {
        function()
          return "▊"
        end,
        color = { fg = colors.blue },
        padding = { left = 1 },
      },
    },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

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
    opts = {
      preset = "tab_only",
      option = {
        lualine_theme = "auto", -- Automatically sync with current colorscheme/lualine
        nerdfont = true,
      },
    },
    lazy = false,
  },
}
