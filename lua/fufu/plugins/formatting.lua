return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

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
        python = { "isort", "black" },
        java = { "google-java-format" },
        elm = { "elm-format" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })

    -- -- auto create a new line if the last line is not empty
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   pattern = "*",
    --   callback = function()
    --     local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, false)[1]
    --     if last_line ~= "" then
    --       vim.api.nvim_buf_set_lines(0, -1, -1, false, { "" })
    --     end
    --   end,
    -- })
  end,
}
