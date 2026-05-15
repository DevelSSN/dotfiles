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
      { "<leader>f", group = "file" },
      { "<leader>ff", "<CMD>Oil --float<CR>", desc = "Oil File Manager" },
      { "-", "<CMD>Oil --float<CR>", desc = "Open parent directory" },
      { "<leader>fF", "<CMD>Oil<CR>", desc = "Oil File Manager" },
      { "<leader>fs", "<CMD>SCReenkey toggle<CR>", desc = "Screenkey toggle" },
    },
    {
      { "<leader>p", group = "plugin" },
      { "<leader>pl", "<CMD>Lazy<CR>", desc = "LazyDev" },
      { "<leader>pm", "<CMD>Mason<CR>", desc = "Mason" },
    },
    {
      { "<leader>g", group = "Git" },
      { "<leader>gg", "<CMD>Git<CR>", desc = "Fugitive" },
    },
    {
      { "<leader>b", group = "buffer" },
      { "<leader>bd", "<CMD>bd<CR>", desc = "Delete buffer" },
      { "<leader>bq", "<CMD>bd<CR><CMD>q<CR>", desc = "Delete buffer" },
    },
    { "<Tab>", "<CMD>tabnext<CR>", desc = "Next buffer" },
    { "<S-Tab>", "<CMD>tabprevious<CR>", desc = "Previous buffer" },
  },
})
