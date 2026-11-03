-- Bootstrap lazy.nvim, then load LazyVim + extras + local plugin specs.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- 1) LazyVim core
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- 2) Extras (order matters: after core, before local specs)
    { import = "lazyvim.plugins.extras.editor.neo-tree" }, -- VSCode-style sidebar tree
    { import = "lazyvim.plugins.extras.ui.smear-cursor" }, -- cursor movement animation (works in any terminal)
    { import = "lazyvim.plugins.extras.lang.markdown" },   -- render-markdown, marksman, browser preview
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.go", cond = vim.fn.executable("go") == 1 }, -- skip where Go is not installed
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    -- { import = "lazyvim.plugins.extras.lang.rust" },    -- enable when reading Rust (needs rustup's rust-analyzer)

    -- 3) Local specs: lua/plugins/*.lua
    { import = "plugins" },
  },
  defaults = { lazy = false, version = false },
  install = { colorscheme = { "noeul", "habamax" } },
  checker = { enabled = true, notify = false }, -- check updates silently; run :Lazy to update
  performance = {
    rtp = {
      disabled_plugins = { "gzip", "tarPlugin", "tohtml", "zipPlugin" },
    },
  },
})
