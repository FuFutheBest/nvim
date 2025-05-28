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

    -- 下一个/上一个 buffer
    vim.keymap.set("n", "<leader>bn", "<Cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
    vim.keymap.set("n", "<leader>bp", "<Cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

    -- 快速关闭当前 buffer
    vim.keymap.set("n", "<leader>bx", "<Cmd>bd<CR>", { desc = "Close current buffer" })

    -- 通过数字跳转到指定 buffer（1-9）
    for i = 1, 9 do
      vim.keymap.set(
        "n",
        "<leader>b" .. i,
        "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
        { desc = "Go to buffer " .. i }
      )
    end

    -- 将当前 buffer 向左/右移动
    vim.keymap.set("n", "<leader><", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left" })
    vim.keymap.set("n", "<leader>>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right" })
  end,
}
