-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")
local springboot_nvim = require("springboot-nvim")
local keymap = vim.keymap

-- Terminal escape
keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

wk.add({

  -- Java Group with Icon
  { "<leader>j", group = " Java", icon = "" },
  { "<leader>jr", springboot_nvim.boot_run, desc = "Run Spring Boot" },
  { "<leader>jc", springboot_nvim.generate_class, desc = "Create Class" },
  { "<leader>ji", springboot_nvim.generate_interface, desc = "Create Interface" },
  { "<leader>je", springboot_nvim.generate_enum, desc = "Create Enum" },
  {
    "<leader>ju",
    function()
      local filename = vim.api.nvim_buf_get_name(0)
      if filename ~= "" then
        springboot_nvim.create_ui(filename)
      end
    end,
    desc = "Open Spring Boot UI",
  },
  { "<leader>jU", springboot_nvim.close_ui, desc = "Close Spring Boot UI" },

  -- Code Group
  { "<leader>c", group = "code" },
  { "<leader>cq", vim.diagnostic.setloclist, desc = "Quickfix List" },
  { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
  { "<leader>cD", vim.lsp.buf.definition, desc = "Go to Definition" },
  { "<leader>ct", vim.lsp.buf.type_definition, desc = "Type Definition" },
  { "<leader>cr", vim.lsp.buf.references, desc = "References" },
  { "<leader>ck", vim.lsp.buf.hover, desc = "Hover" },
}, { mode = "n" }) -- 'n' for normal mode
