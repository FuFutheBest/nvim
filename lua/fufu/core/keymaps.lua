local keymap = vim.keymap

----------------------------------------------------------------------
-- Insert mode mappings
----------------------------------------------------------------------

-- Exit insert mode quickly by pressing "jk"
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode using 'jk'" })

----------------------------------------------------------------------
-- Normal mode mappings
----------------------------------------------------------------------

-- Clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Delete a character without affecting default registers
keymap.set("n", "x", '"_x', { desc = "Delete character without copying" })

-- Increment / decrement numbers
keymap.set("n", "+", "<C-a>", { desc = "Increment number under cursor" })
keymap.set("n", "-", "<C-x>", { desc = "Decrement number under cursor" })

----------------------------------------------------------------------
-- Window management
----------------------------------------------------------------------

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize window sizes" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split window" })

----------------------------------------------------------------------
-- Tab management
----------------------------------------------------------------------

-- keymap.set("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "Open a new tab" })
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<cr>", { desc = "Close current tab" })
-- keymap.set("n", "<leader>]", "<cmd>tabn<cr>", { desc = "Go to next tab" })
-- keymap.set("n", "<leader>[", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<cr>", { desc = "Open current buffer in a new tab" })

----------------------------------------------------------------------
-- Terminal (commented out but preserved as requested)
----------------------------------------------------------------------

-- keymap.set(
--   "n",
--   "<leader>ts",
--   "<cmd>split<CR><cmd>terminal<CR><cmd>startinsert<CR>",
--   { desc = "Open terminal in a split window" }
-- )
-- keymap.set("t", "<leader>tn", "<C-\\><C-n>", { desc = "Exit terminal insert mode" })
-- keymap.set("t", "<leader>tx", "<C-\\><C-n>:q<CR>", { desc = "Close terminal window" })

----------------------------------------------------------------------
-- Visual mode behavior
----------------------------------------------------------------------

-- Exit visual mode using "q"
keymap.set("v", "q", "<Esc>", { silent = true, desc = "Exit visual mode" })

-- Move to start/end of line
keymap.set("n", "H", "^", { desc = "Move to start of line" })
keymap.set("n", "L", "$", { desc = "Move to end of line" })

-- Move selected lines up/down
keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up" })

-- Join lines without moving the cursor
keymap.set("n", "J", "mzJ`z", { desc = "Join line without cursor jump" })

-- Indent stay in visual mode
keymap.set("v", "<", "<gv", { desc = "Indent left and keep selection" })
keymap.set("v", ">", ">gv", { desc = "Indent right and keep selection" })

----------------------------------------------------------------------
-- Buffer navigation
----------------------------------------------------------------------

-- Navigation
keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>c", "<cmd>bd<CR>", { desc = "Close current buffer" })

----------------------------------------------------------------------
-- Clipboard
----------------------------------------------------------------------
---When pasting a selection, keep the text
keymap.set("x", "p", [["_dP]])
