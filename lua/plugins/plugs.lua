local sp_path = vim.fn.stdpath("data") .. "/mason/share/vscode-spring-boot-tools/"
return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = function()
      local M = {
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          java = { "clang-format" },
          lua = { "stylua" },
          python = { "autopep8" },
          xml = { "xmlformatter" },
        },
      }
      return M
    end,
  },
  {
    "DevelSSN/springboot-nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-jdtls",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      local springboot_nvim = require("springboot-nvim")
      springboot_nvim.setup()
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        -- "github:redhat-developer/vscode-quarkus",
      },
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "jdtls",
          "lua_ls",
          "stylua",
          -- "ts_ls",
          -- "tailwindcss",
          "marksman",
          "lemminx",
          "clangd",
          "postgres_lsp",
          -- "cssls",
          -- "vscode-spring-boot-tools",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("blink-cmp").get_lsp_capabilities({}, true)

      -- Setup lua_ls normally
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = "LuaJIT" },
            completion = { callSnippet = "Replace" },
          },
        },
      })

      require("lspconfig").svelte.setup({})
      local lsp_configs = {
        cssls = require("config.lsp.cssls"),
        html = require("config.lsp.html"),
        jdtls = require("config.lsp.jdtls"),
        twind = require("config.lsp.twind"),
        ts_ls = require("lspconfig.configs.ts_ls"),
      }

      for server_name, config in pairs(lsp_configs) do
        vim.lsp.config(server_name, config)
      end

      vim.lsp.enable({ "cssls", "html", "jdtls", "twind", "ts_ls" })
    end,
  },
  {
    "JavaHello/spring-boot.nvim",
    ft = { "java", "yaml", "jproperties" },
    dependencies = {
      "mfussenegger/nvim-jdtls", -- or nvim-java, nvim-lspconfig
      "ibhagwan/fzf-lua",
    },
    --@type bootls.Config
    opts = {
      log_file = "/tmp/log.log",
      ls_path = sp_path .. "/language-server.jar",
    },
  },
}
