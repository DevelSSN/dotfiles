-- Enable lua_ls for Lua files
vim.lsp.enable("lua_ls")

-- Or define specific settings if needed
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognizes the global vim table
      },
      workspace = {
        library = {
          vim.env.VIMRUNTIME, -- Includes Neovim's runtime paths
          "$XDG_DATA_HOME/nvim/lazy",
          "${3rd}/luv/library",
        },
      },
    },
  },
})
