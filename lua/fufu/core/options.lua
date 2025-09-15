vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4 -- spaces for tabs (prettier default)
opt.shiftwidth = 4 -- spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- command line
opt.cmdheight = 1 -- more space in the neovim command line for displaying messages

-- appearance
opt.termguicolors = true -- turn on termguicolors for nightfly colorscheme to work
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

-- identify non-ASCII characters and highlight them
vim.cmd([[
  syntax match NonASCII "[^\x00-\x7F]"
  highlight NonASCII ctermfg=white ctermbg=red guifg=#ffffff guibg=#ff0000
]])

-- Silence the specific position encoding message
local notify_original = vim.notify
vim.notify = function(msg, ...)
  if
    msg
    and (
      msg:match("position_encoding param is required")
      or msg:match("Defaulting to position encoding of the first client")
      or msg:match("multiple different client offset_encodings")
    )
  then
    return
  end
  return notify_original(msg, ...)
end
