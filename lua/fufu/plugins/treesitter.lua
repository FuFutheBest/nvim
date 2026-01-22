vim.api.nvim_create_autocmd({ "Filetype" }, {
  callback = function(event)
    -- make sure nvim-treesitter is loaded
    local ok, nvim_treesitter = pcall(require, "nvim-treesitter")

    -- no nvim-treesitter, maybe fresh install
    if not ok then
      return
    end

    local parsers = require("nvim-treesitter.parsers")

    if not parsers[event.match] or not nvim_treesitter.install then
      return
    end

    local ft = vim.bo[event.buf].ft
    local lang = vim.treesitter.language.get_lang(ft)
    nvim_treesitter.install({ lang }):await(function(err)
      if err then
        vim.notify("Treesitter install error for ft: " .. ft .. " err: " .. err)
        return
      end

      pcall(vim.treesitter.start, event.buf)

      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
      vim.wo.foldmethod = "expr"
      vim.opt.foldlevel = 99
    end)
  end,
})

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    branch = "main",

    config = function()
      local ensure_installed = {
        "bash",
        "c",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
        "query",
        "regex",
        "css",
        "html",
        "javascript",
        "latex",
        "scss",
        "svelte",
        "typst",
        "vue",
      }

      -- make sure nvim-treesitter can load
      local ok, nvim_treesitter = pcall(require, "nvim-treesitter")

      if not ok then
        return
      end

      nvim_treesitter.install(ensure_installed)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      vim.g.no_plugin_maps = true
    end,

    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          -- Automatically jump forward to textobj, similar to targets.vim
          lookahead = true,
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "v", -- linewise
          },
          include_surrounding_whitespace = false,
        },
        move = {
          enable = true,
          set_jumps = true,
        },
        swap = {
          enable = true,
        },
      })
    end,

    keys = {
      {
        "af",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end,
        desc = "Select outer function",
        mode = { "x", "o" },
      },
      {
        "if",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end,
        desc = "Select inner function",
        mode = { "x", "o" },
      },
      {
        "ac",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end,
        desc = "Select outer class",
        mode = { "x", "o" },
      },
      {
        "ic",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end,
        desc = "Select inner class",
        mode = { "x", "o" },
      },
      -- {
      --   "as",
      --   function()
      --     require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
      --   end,
      --   desc = "Select scope",
      --   mode = { "n", "x", "o" },
      -- },
      {
        "[f",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        desc = "prev function",
        mode = { "n", "x", "o" },
      },
      {
        "]f",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        desc = "next function",
        mode = { "n", "x", "o" },
      },
      {
        "[F",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
        end,
        desc = "prev function end",
        mode = { "n", "x", "o" },
      },
      {
        "]F",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
        end,
        desc = "next function end",
        mode = { "n", "x", "o" },
      },
      {
        "[a",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.outer", "textobjects")
        end,
        desc = "prev argument",
        mode = { "n", "x", "o" },
      },
      {
        "]a",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.outer", "textobjects")
        end,
        desc = "next argument",
        mode = { "n", "x", "o" },
      },
      {
        "[A",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.outer", "textobjects")
        end,
        desc = "prev argument end",
        mode = { "n", "x", "o" },
      },
      {
        "]A",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.outer", "textobjects")
        end,
        desc = "next argument end",
        mode = { "n", "x", "o" },
      },
      {
        "[b",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects")
        end,
        desc = "prev block",
        mode = { "n", "x", "o" },
      },
      {
        "]b",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects")
        end,
        desc = "next block",
        mode = { "n", "x", "o" },
      },
      {
        "[B",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_end("@block.outer", "textobjects")
        end,
        desc = "prev block",
        mode = { "n", "x", "o" },
      },
      {
        "]B",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_end("@block.outer", "textobjects")
        end,
        desc = "next block",
        mode = { "n", "x", "o" },
      },
      {
        ";",
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_next()
        end,
        desc = "Repeat last move",
        mode = { "n", "x", "o" },
      },
      {
        ",",
        function()
          require("nvim-treesitter-textobjects.repeatable_move").repeat_last_move_previous()
        end,
        desc = "Undo last move",
        mode = { "n", "x", "o" },
      },
      {
        "<leader>san",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
        end,
        desc = "swap next argument",
      },
      {
        "<leader>sap",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
        end,
        desc = "swap prev argument",
      },
    },
  },
}
