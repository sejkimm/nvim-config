-- Loaded after LazyVim's defaults (lazyvim/config/options.lua).

-- Reading-first: never rewrite a file on :w (format-on-save off globally).
-- Toggle back with <leader>uf (global) / <leader>uF (buffer).
vim.g.autoformat = false

local opt = vim.opt

-- Carried over from the previous config
opt.scrolloff = 10 -- keep 10 lines of context around the cursor
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.wrap = false -- code: no soft wrap (markdown gets wrap in autocmds.lua)

-- Cursor: thin bar everywhere (Normal, Visual, Insert, command line, terminal), like Ghostty's
-- cursor-style. Replace and operator-pending keep the underline so a pending d/c/y stays visible.
-- In terminals this is the default shape; a program can still change it with escape codes.
-- pi draws its own block cursor unless showHardwareCursor is on (~/.pi/agent/settings.json).
opt.guicursor = "n-v-c-sm-i-ci-ve:ver25,r-cr-o:hor20,t:ver25-blinkon500-blinkoff500-TermCursor"

-- Clipboard
--   local: sync with the macOS clipboard (LazyVim default)
--   SSH  : copy through the terminal with OSC 52 (built into Neovim >= 0.10,
--          replaces the old nvim-osc52 plugin). Ghostty supports OSC 52.
if vim.env.SSH_TTY or vim.env.SSH_CONNECTION then
  local osc52 = require("vim.ui.clipboard.osc52")
  local function paste()
    -- Paste from the unnamed register instead of asking the terminal
    -- (OSC 52 read is blocked or prompts in most terminals).
    return { vim.fn.split(vim.fn.getreg(""), "\n"), vim.fn.getregtype("") }
  end
  vim.g.clipboard = {
    name = "OSC 52",
    copy = { ["+"] = osc52.copy("+"), ["*"] = osc52.copy("*") },
    paste = { ["+"] = paste, ["*"] = paste },
  }
  opt.clipboard = "unnamedplus"
end
