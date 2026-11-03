-- Plugin keys that used Ctrl+Q / Ctrl+W / Ctrl+E, which are reserved by system-wide shortcuts.
-- Each original key is disabled (= false) and its action moved to an Alt key.
-- Non-plugin remaps live in lua/config/keymaps.lua.
return {
  -- Completion menu: Ctrl-e cancel -> Alt-e (Esc also closes it)
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<C-e>"] = false,
        ["<M-e>"] = { "cancel", "fallback" },
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      -- Terminal windows (lazygit float): let the program inside keep Esc and Ctrl-hjkl.
      terminal = {
        win = {
          keys = {
            term_normal = false, -- Esc Esc -> normal mode
            nav_h = false,
            nav_j = false,
            nav_k = false,
            nav_l = false,
          },
        },
      },
      picker = {
        win = {
          input = {
            keys = {
              ["<c-q>"] = false,
              ["<a-q>"] = { "qflist", mode = { "i", "n" } }, -- send results to quickfix list
              ["<a-bs>"] = { "<c-s-w>", mode = { "i" }, expr = true, desc = "delete word" },
            },
          },
          list = {
            keys = {
              ["<c-q>"] = false,
              ["<a-q>"] = "qflist",
            },
          },
        },
        sources = {
          -- Projects picker (dashboard "p"): Ctrl-e explorer / Ctrl-w cd -> Alt-e / Alt-o (Alt-c is LazyVim toggle_cwd)
          projects = {
            win = {
              input = {
                keys = {
                  ["<c-e>"] = false,
                  ["<c-w>"] = false,
                  ["<a-e>"] = { { "tcd", "picker_explorer" }, mode = { "n", "i" } },
                  ["<a-o>"] = { { "tcd" }, mode = { "n", "i" } },
                },
              },
            },
          },
        },
      },
    },
  },
}
