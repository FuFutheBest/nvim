return {

  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins

    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = false,
      auto_integrations = true,
    },

    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },

  -- Bars
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    version = "*",
    opts = {
      options = {
        mode = "buffers",
        numbers = "both",
        diagnostics = "nvim_lsp",
        separator_style = "slant",
        always_show_bufferline = true,
      },
    },

    config = function(_, opts)
      local keymap = vim.keymap

      require("bufferline").setup(opts)

      -- Move buffers left and right
      keymap.set("n", "<leader><", "<Cmd>BufferLineMovePrev<CR>", { desc = "Move buffer left", silent = true })
      keymap.set("n", "<leader>>", "<Cmd>BufferLineMoveNext<CR>", { desc = "Move buffer right", silent = true })

      -- Jump to buffer 1–9
      for i = 1, 9 do
        keymap.set(
          "n",
          "<leader>b" .. i,
          "<Cmd>BufferLineGoToBuffer " .. i .. "<CR>",
          { desc = "Go to buffer " .. i, silent = true }
        )
      end

      -- Close other buffers
      keymap.set("n", "<leader>bxo", "<Cmd>BufferLineCloseOthers<CR>", {
        desc = "Close all buffers except current",
        silent = true,
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
      sections = {
        lualine_c = { { "filename", path = 3 } },
      },
    },
  },

  -- Display Keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },
}
