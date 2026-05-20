local wk = require("which-key")

wk.add({
  {
    { mode = "n" },
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {
      "<leader>!",
      function()
        require("which-key").show({ global = true })
      end,
      desc = "Global Keymaps (which-key)",
    },
    {
      -- Code Group
      { "<leader>c", group = "code" },
      { "<leader>cq", vim.diagnostic.setloclist, desc = "Quickfix List" },
      { "<leader>ca", vim.lsp.buf.code_action, desc = "Code Action" },
      { "<leader>cd", vim.lsp.buf.definition, desc = "Go to Definition" },
      { "<leader>ct", vim.lsp.buf.type_definition, desc = "Type Definition" },
      { "<leader>cr", vim.lsp.buf.references, desc = "References" },
      { "<leader>ck", vim.lsp.buf.hover, desc = "Hover" },
      {
        "<leader>cf",
        function()
          require("conform").format({ lsp_fallback = true })
        end,
        desc = "Format Code",
      },
    },
    {
      { "<leader>p", group = "plugin" },
      { "<leader>pl", "<CMD>Lazy<CR>", desc = "LazyDev" },
      { "<leader>pm", "<CMD>Mason<CR>", desc = "Mason" },
    },
    {
      { "<leader>b", group = "buffer" },
      { "<leader>bd", "<CMD>bd<CR>", desc = "Delete buffer" },
    },
    { "<Tab>", "<CMD>tabnext<CR>", desc = "Next buffer" },
    { "<S-Tab>", "<CMD>tabprevious<CR>", desc = "Previous buffer" },
    { "<leader>q", "<CMD>q<CR>", desc = "Quit" },
  },
})
