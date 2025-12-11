-- ===========================
--        Netrw Config
-- ===========================

local g = vim.g

g.netrw_liststyle = 3 -- Use tree-style listing
g.netrw_keepdir = 0 -- Allow changing CWD
g.netrw_browse_split = 0 -- Open file in current tab
g.netrw_altv = 1 -- When splitting vertically, open the new window to the right
g.netrw_preview = 1 -- Enable file preview window
g.netrw_fastbrowse = 1 -- Enable fast browsing
g.netrw_localmovecmd = "mv" -- Resolve deleting and renaming issues in tree style listing
