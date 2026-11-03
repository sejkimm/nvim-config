-- Korean input: switch to the English layout whenever Neovim leaves a typing mode
-- (Insert, command line, terminal), so Normal-mode keys like j, k, <leader>ff work right
-- after typing Korean. Alt keys while still typing are handled in Ghostty (ghostty/config.snippet).
--
-- Switching back to Korean is left to the user (Han/Eng key). Auto-restore is off on purpose:
-- selecting a CJK input source makes macism flash a helper window for ~150 ms, which steals
-- focus and can drop the first keys typed. Turn it on with set_previous_events below.
return {
  "keaising/im-select.nvim",
  cond = vim.fn.has("mac") == 1,
  event = "VeryLazy",
  opts = {
    -- macOS: needs `macism` on PATH (see README). The plugin reports an error if it is missing.
    default_command = "macism",
    default_im_select = "com.apple.keylayout.ABC",
    set_default_events = { "InsertLeave", "CmdlineLeave", "TermLeave" },
    set_previous_events = {}, -- e.g. { "InsertEnter", "TermEnter" } to restore Korean
  },
}
