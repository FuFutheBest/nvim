return {
  "github/copilot.vim",

  config = function()
    local keymap = vim.keymap

    keymap.set("n", "<leader>ce", ":Copilot enable<CR>", { desc = "Enable Copilot" })
    keymap.set("n", "<leader>cd", ":Copilot disable<CR>", { desc = "Disable Copilot" })

    -- Use <C-O> in insert mode to accept Copilot suggestions
    vim.keymap.set("i", "<C-O>", 'copilot#Accept("\\<CR>")', {
      expr = true,
      replace_keycodes = false,
      desc = "Accept Copilot suggestion",
    })
    vim.g.copilot_no_tab_map = true
  end,
}
