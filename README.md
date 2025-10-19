# My_Neovim_Configuration

My personal daily-use Neovim setup

## Dependencies

- Node, Ripgrep
- Kitty, ImageMagic(for image.nvim)

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
                │           ├── dressing.lua
                │           ├── formatting.lua
                │           ├── gitsigns.lua
                │           ├── image-viewer.lua
                │           ├── indent-blankline.lua
                │           ├── init.lua
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
- [Chinese guide](https://github.com/archibate/vimrc)
