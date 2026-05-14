local sp_path = vim.fn.stdpath("data") .. "/mason/share/vscode-spring-boot-tools/"
return {
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
  {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt" },
    dependencies = {
      "saghen/blink.cmp",
    },

    opts = function()
      local metals_config = require("metals").bare_config()

      -- ✅ IMPORTANT: blink capabilities (fixes auto-import + completion)
      metals_config.capabilities = require("blink.cmp").get_lsp_capabilities()

      metals_config.init_options.statusBarProvider = "off"

      metals_config.settings = {
        showImplicitArguments = true,
        showInferredType = true,
        excludedPackages = {},
      }

      metals_config.on_attach = function(client, bufnr)
        -- Optional keymaps
        local opts = { buffer = bufnr, silent = true }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      end

      return metals_config
    end,

    config = function(_, metals_config)
      local group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "scala", "sbt" },
        callback = function()
          require("metals").initialize_or_attach(metals_config)
        end,
        group = group,
      })
    end,
  },
}
