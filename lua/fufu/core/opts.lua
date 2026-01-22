local opt = vim.opt

----------------------------------------------------------
-- UI & Appearance
-----------------------------------------------------------

-- Line Numbering
opt.relativenumber = true -- Enable relative line numbering (useful for movement commands)
opt.number = true -- Enable absolute line numbering

-- Appearance
opt.termguicolors = true -- Enable true colors (24-bit color support)
opt.background = "dark" -- Set default background to dark (helps colorschemes load correctly)
opt.signcolumn = "yes" -- Always show the sign column (prevents text jumping when signs appear)
opt.cmdheight = 1 -- Set the command-line height
opt.cursorline = true -- Highlight the current cursor line

-----------------------------------------------------------
-- Tabs & Indentation
-----------------------------------------------------------

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true -- Convert all typed tabs into spaces
opt.autoindent = true -- Copy indent from the current line when starting a new one

-----------------------------------------------------------
-- Editing & Behavior
-----------------------------------------------------------

-- Line Wrapping
opt.wrap = true -- Enable line wrapping
opt.breakindent = true
opt.linebreak = true
opt.showbreak = "↳ "

-- Backspace
opt.backspace = "indent,eol,start" -- Allow backspacing over indent, end-of-line, and insert-mode start

-- Clipboard
opt.clipboard:append("unnamedplus") -- Use system clipboard as the default register ("unnamedplus" means system clipboard)

-- Undo File
opt.undofile = true -- Enable persistent undo history (undo changes even after closing and reopening)

-- Swap File
opt.swapfile = false -- Disable swap files (improves performance, but less crash resilience)

-----------------------------------------------------------
-- Searching
-----------------------------------------------------------

opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- If search pattern contains mixed case, assume case-sensitive search

-----------------------------------------------------------
-- Splits & Windows
-----------------------------------------------------------

opt.splitright = true -- When splitting vertically, place new window to the right
opt.splitbelow = true -- When splitting horizontally, place new window to the bottom

-- Scrolling & Context
opt.scrolloff = 8 -- Lines kept above/below the cursor when scrolling vertically
-- opt.sidescrolloff = 4 -- Columns kept on the sides when scrolling horizontally

-----------------------------------------------------------
-- Completion & Performance
-----------------------------------------------------------

-- Completion Menu
opt.completeopt = "menu,menuone,noselect" -- Configure completion: use menu, show menu even for one match, don't auto-select first item

-- Update Time (Crucial for LSP/Plugins)
opt.updatetime = 50 -- Set time (ms) to wait for `CursorHold` events (affects LSP features/Git signs)

-----------------------------------------------------------
-- Visualizing Hidden Characters
-----------------------------------------------------------

opt.list = true -- Enable the display of invisible characters defined in 'listchars'

opt.listchars = {
  tab = "» ", -- Show Tab character as '» '
  trail = "·", -- Show trailing spaces as '·'
  nbsp = "␣", -- Show non-breaking space as '␣'
}
