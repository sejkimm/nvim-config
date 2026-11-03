-- Loaded after LazyVim's default keymaps (on VeryLazy).
-- Full list of defaults: https://www.lazyvim.org/keymaps  or  <leader>sk
-- Human-readable cheat sheet: guide/cheatsheet.md (keep both in sync).
local map = vim.keymap.set
local del = vim.keymap.del

-- Layout rule: Alt = windows. Works the same in Normal, Insert and Visual mode.
-- Neovim is the code editor in one Ghostty pane; shells live in Ghostty splits, not in Neovim.
-- Ghostty needs `macos-option-as-alt = left` for Option to send Alt.

-- Removed LazyVim defaults (one key per job, nothing that fights macOS or terminal programs):
--   <C-hjkl>      window move        -> Alt-hjkl
--   <C-arrows>    window resize      -> Alt-Shift-hjkl (Ctrl-arrows switch macOS Spaces)
--   <A-j>/<A-k>   move line (i, v)   -> gone, Alt-j/k is window move everywhere
--   <leader>- / <leader>|            -> <leader>ws / <leader>wv
--   <leader>ft / <leader>fT / <C-/>  -> gone, shells live in Ghostty splits
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")
del("n", "<C-Up>")
del("n", "<C-Down>")
del("n", "<C-Left>")
del("n", "<C-Right>")
del({ "i", "v" }, "<A-j>")
del({ "i", "v" }, "<A-k>")
del("n", "<leader>-")
del("n", "<leader>|")
del("n", "<leader>ft")
del("n", "<leader>fT")
del({ "n", "t" }, "<C-/>")
del({ "n", "t" }, "<C-_>")

-- Every layout key is mapped in Normal, Insert and Visual mode. An unmapped Alt key arrives
-- as Esc + key, so Alt-J in Insert mode would leave Insert and join lines.
-- Moving focus ends typing or the selection first; resizing keeps the mode.
local modes = { "n", "i", "x" }

-- Alt-hjkl: move to the window in that direction.
local nav = { h = "Left", j = "Down", k = "Up", l = "Right" }
for key, dir in pairs(nav) do
  map(modes, "<M-" .. key .. ">", "<C-\\><C-n><C-w>" .. key, { desc = "Go to " .. dir:lower() .. " window" })
end

-- Alt-Shift-hjkl: push the window border in that direction.
local function resize(dir)
  return function()
    local horizontal = dir == "h" or dir == "l"
    local forward = dir == "l" or dir == "j"
    local has_next = vim.fn.winnr(horizontal and "l" or "j") ~= vim.fn.winnr()
    local step = has_next == forward and "+5" or "-5"
    vim.cmd((horizontal and "vertical resize " or "resize ") .. step)
  end
end
for key, dir in pairs(nav) do
  map(modes, "<M-" .. key:upper() .. ">", resize(key), { desc = "Resize window " .. dir:lower() })
end

-- Alt-m: zoom the current window (same as <leader>wm).
map(modes, "<M-m>", "<C-\\><C-n><Cmd>lua Snacks.zen.zoom()<CR>", { desc = "Zoom window" })

-- Ctrl+Q / Ctrl+W / Ctrl+E are reserved by system-wide shortcuts, so their Neovim jobs move:
--   Ctrl-w {cmd}  window commands       -> <leader>w {cmd}  (LazyVim which-key proxy: ␣wv ␣ws ␣wo ␣w= ...)
--   Ctrl-w        delete word (insert/:) -> Alt-Backspace (same as macOS text fields)
--   Ctrl-e/Ctrl-y scroll one line        -> Alt-e / Alt-y
--   Ctrl-q        visual block           -> Ctrl-v (built-in alias, nothing to do)
--   Plugin keys (picker quickfix, completion cancel, projects) -> lua/plugins/keys.lua
map({ "i", "c" }, "<M-BS>", "<C-w>", { desc = "Delete word before cursor" })
map({ "n", "x" }, "<M-e>", "<C-e>", { desc = "Scroll down one line" })
map({ "n", "x" }, "<M-y>", "<C-y>", { desc = "Scroll up one line" })
map("i", "<M-e>", "<C-x><C-e>", { desc = "Scroll down one line" }) -- blink.cmp's Alt-e cancels the menu first
map("i", "<M-y>", "<C-x><C-y>", { desc = "Scroll up one line" })
