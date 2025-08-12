return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    -- import mason
    local mason = require("mason")

    -- import mason-lspconfig
    local mason_lspconfig = require("mason-lspconfig")

    local mason_tool_installer = require("mason-tool-installer")

    -- enable mason and configure icons
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      automatic_enable = true,
      automatic_installation = true,

      -- list of servers for mason to install
      ensure_installed = {
        -- Web development related
        "html", -- HTML
        "cssls", -- CSS
        "tailwindcss", -- CSS
        "svelte",
        "emmet_ls", -- Emmet
        "prismals", -- JavaScript and TypeScript

        -- Lua for Neovim
        "lua_ls",

        -- Elm
        "elmls",

        -- Python
        "pyright",

        -- C/C++
        "clangd",

        -- Markdown
        "marksman",

        -- Default
        "graphql",
        "ast_grep",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        -- Python formatter
        "prettier",
        "black",

        -- Lua formatter
        "stylua",

        -- Python linter
        "pylint",

        -- JavaScript/TypeScript linter
        "eslint_d",
      },
    })

    vim.api.nvim_create_user_command("LspInstallRoot", function()
      for _, client in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
        print(client.name .. ": " .. vim.fn.exepath(client.config.cmd[1]))
      end
    end, {})

    vim.api.nvim_create_user_command("LspInlayHintToggle", function()
      if vim.lsp.inlay_hint.is_enabled() then
        vim.lsp.inlay_hint.enable(false)
      else
        vim.lsp.inlay_hint.enable(true)
      end
    end, { desc = "Toggle inlay hints" })

    vim.api.nvim_create_user_command("LspDiagnosticsToggle", function()
      if vim.diagnostic.is_enabled() then
        vim.diagnostic.enable(false)
      else
        vim.diagnostic.enable(true)
      end
    end, { desc = "Toggle diagnostics" })
  end,
}
