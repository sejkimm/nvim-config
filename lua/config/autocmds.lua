-- Loaded after LazyVim's default autocmds.

-- LazyVim turns on wrap + spell for markdown/text. Spellcheck flags every Korean
-- word, so replace that group with wrap + linebreak only.
pcall(vim.api.nvim_del_augroup_by_name, "lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("reading_prose", { clear = true }),
  pattern = { "markdown", "text", "gitcommit", "plaintex", "typst" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- break at word boundaries
    vim.opt_local.spell = false
  end,
})

-- Winbar: each split shows the file it holds (path relative to cwd, [+] when modified).
-- Only file buffers in normal windows; terminals, the sidebar tree and floats stay bare.
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = vim.api.nvim_create_augroup("file_winbar", { clear = true }),
  callback = function()
    local is_float = vim.api.nvim_win_get_config(0).relative ~= ""
    local is_file = vim.bo.buftype == "" and vim.api.nvim_buf_get_name(0) ~= ""
    vim.opt_local.winbar = (is_file and not is_float) and " %f %m" or ""
  end,
})
