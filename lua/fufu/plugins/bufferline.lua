return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
    },
  },

  config = function(_, opts)
    local bufferline = require("bufferline")

    -- set up bufferline with options
    bufferline.setup(opts)

    -- next and previous buffer keymaps
    vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

    -- close current buffer
    vim.keymap.set("n", "<leader>bx", "<Cmd>bd<CR>", { desc = "Close current buffer" })

    -- close all buffers except the current one
    for i = 1, 9 do
      vim.keymap.set(
        "n",
        "<leader>b" .. i,
        "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
        { desc = "Go to buffer " .. i }
      )
    end

    -- move buffers left and right
    vim.keymap.set("n", "<leader><", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
    vim.keymap.set("n", "<leader>>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
  end,
}
