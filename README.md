# nvim-config

> A Neovim config for reading code and Markdown, built on LazyVim

Key cheat sheet: [guide/cheatsheet.md](guide/cheatsheet.md)

## Install

Neovim 0.11.2+ (LazyVim's minimum) on macOS, in Ghostty:

```sh
brew install neovim tree-sitter-cli ripgrep fd fzf lazygit imagemagick ghostscript
git clone https://github.com/sejkimm/nvim-config ~/.config/nvim
nvim   # installs plugins, LSP servers and treesitter parsers on first start
```

Input source switching needs [macism](https://github.com/laishulu/macism) on `PATH`:

```sh
git clone --depth 1 --branch v3.1.1 https://github.com/laishulu/macism
make -C macism macism
ln -s "$PWD/macism/macism" ~/.local/bin/macism
```

Ghostty: add the lines from [ghostty/config.snippet](ghostty/config.snippet) to `~/.config/ghostty/config`.

## Related

- [LazyVim](https://github.com/LazyVim/LazyVim): the base distribution
- [Noeul](https://github.com/sejkimm/noeul): colorscheme, browser preview style and Ghostty themes
- [macism](https://github.com/laishulu/macism) with [im-select.nvim](https://github.com/keaising/im-select.nvim): English input source outside Insert mode
- [Ghostty](https://ghostty.org): the terminal this config is tuned for

## License

nvim-config is released under the [MIT License](LICENSE).
