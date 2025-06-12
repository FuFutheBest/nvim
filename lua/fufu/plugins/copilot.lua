return {
  "github/copilot.vim",

  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
    keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })
  end,
}
