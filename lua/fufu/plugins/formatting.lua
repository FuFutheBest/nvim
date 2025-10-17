return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")
    local home = os.getenv("HOME")

    local auto_format_filetypes = {
      lua = true,
      python = true,
      cpp = true,
      c = true,
      -- elm = true,
      javascript = true,
      typescript = true,
      javascriptreact = true,
      typescriptreact = true,
      svelte = true,
      css = true,
      html = true,
      json = true,
      yaml = true,
      markdown = true,
      graphql = true,
      liquid = true,
    }

    conform.setup({
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
        liquid = { "prettier" },
        lua = { "stylua" },
        -- elm = { "elm-format" },
        python = { "isort", "black" },
        c = { "clang-format" },
        cpp = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          command = "clang-format",
          args = {
            "--style=file:" .. home .. "/.config/nvim/dotfiles/.clang-format",
          },
        },
      },

      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        if auto_format_filetypes[ft] then
          return {
            lsp_fallback = true,
            async = false,
            timeout_ms = 1000,
          }
        else
          return false
        end
      end,
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
