local api = vim.api

api.nvim_create_augroup("FiletypeCustomIndents", { clear = true })

local filetype_settings = {
  -- Makefile: Must use HARD TABS (\t), standard width is 8.
  make = { ts = 8, sw = 8, et = false },

  -- Configuration Files & Data Serialization (YAML, JSON)
  -- 2 spaces are common for config files to maintain density.
  yaml = { ts = 2, sw = 2, et = true },
  json = { ts = 2, sw = 2, et = true },

  -- Frontend Development (HTML, CSS, SCSS, LESS)
  -- 2 spaces are widely used in this community.
  html = { ts = 2, sw = 2, et = true },
  css = { ts = 2, sw = 2, et = true },
  scss = { ts = 2, sw = 2, et = true },
  less = { ts = 2, sw = 2, et = true },

  -- Scripting & Markup
  markdown = { ts = 2, sw = 2, et = true }, -- 2 spaces are preferred for markdown lists/nested content.
  lua = { ts = 2, sw = 2, et = true }, -- 2 spaces for Neovim config and Lua scripts.

  -- Shell/Config Files
  sh = { ts = 4, sw = 4, et = true }, -- Shell scripts often follow the default 4 space rule.
  conf = { ts = 4, sw = 4, et = true }, -- Generic configuration files.
}

-- Create Autocmds
for filetype, settings in pairs(filetype_settings) do
  api.nvim_create_autocmd("FileType", {
    group = "FiletypeCustomIndents",
    pattern = filetype,
    callback = function()
      vim.bo.tabstop = settings.ts
      vim.bo.shiftwidth = settings.sw
      vim.bo.expandtab = settings.et
    end,
  })
end
