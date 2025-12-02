# My_Neovim_Configuration

My personal daily-use Neovim setup

## Dependencies

- Node, Ripgrep(for telescope)
- Kitty, ImageMagic(for image.nvim)
- Jupyter related( [molten](https://github.com/benlubas/molten-nvim/blob/main/docs/Not-So-Quick-Start-Guide.md), [jupytext](https://github.com/mwouts/jupytext/blob/main/README.md) )

## Structure

```bash
$HOME/.config/nvim
                ├── dotfiles
                ├── init.lua
                ├── lazy-lock.json
                ├── lua
                │   └── fufu
                │       ├── core
                │       │   ├── init.lua
                │       │   ├── keymaps.lua
                │       │   └── options.lua
                │       ├── lazy.lua
                │       └── plugins
                │           ├── alpha.lua
                │           ├── autopairs.lua
                │           ├── auto-session.lua
                │           ├── bufferline.lua
                │           ├── colorscheme.lua
                │           ├── comment.lua
                │           ├── copilot.lua
                │           ├── diagram.lua
                │           ├── dressing.lua
                │           ├── formatting.lua
                │           ├── gitsigns.lua
                │           ├── image.lua
                │           ├── indent-blankline.lua
                │           ├── init.lua
                │           ├── jupyter.lua
                │           ├── lazygit.lua
                │           ├── linting.lua
                │           ├── lsp
                │           │   ├── lspconfig.lua
                │           │   └── mason.lua
                │           ├── lualine.lua
                │           ├── markview.lua
                │           ├── nvim-cmp.lua
                │           ├── nvim-tree.lua
                │           ├── substitute.lua
                │           ├── surround.lua
                │           ├── telescope.lua
                │           ├── todo-comment.lua
                │           ├── treesitter.lua
                │           ├── trouble.lua
                │           ├── vim-maximizer.lua
                │           └── which-key.lua
                └── README.md
```

## References

- [Overall setup](https://www.josean.com/posts/how-to-setup-neovim-2024)
- [Chinese sample](https://github.com/archibate/vimrc)
