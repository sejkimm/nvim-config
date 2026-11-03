-- Noeul (github.com/sejkimm/noeul). "noeul" follows 'background', which Neovim reads from
-- the terminal, so it switches with the terminal's light/dark theme (macOS appearance).
return {
  { "sejkimm/noeul", lazy = false, priority = 1000 },
  { "LazyVim/LazyVim", opts = { colorscheme = "noeul" } },
}
