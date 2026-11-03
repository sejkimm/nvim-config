return {
  -- No buffer line at the top. Buffers are global in Vim, so a tab-like strip suggests
  -- per-pane tabs that don't exist. Each window shows its own file in the winbar instead
  -- (lua/config/autocmds.lua); switch files with <leader>, and <leader><space>.
  -- <S-h>/<S-l> and [b/]b fall back to LazyVim's :bprevious/:bnext.
  { "akinsho/bufferline.nvim", enabled = false },

  -- Cursor animation (LazyVim extra ui.smear-cursor) at the plugin's default speed.
  -- The cursor is a thin bar in every mode (guicursor in lua/config/options.lua), so the smear
  -- is drawn as a bar too.
  {
    "sphamba/smear-cursor.nvim",
    optional = true,
    opts = {
      vertical_bar_cursor = true,
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      -- Inline images (markdown, image files) via the Kitty graphics protocol.
      -- Ghostty supports it. Non-PNG formats are converted with ImageMagick (`magick`).
      image = { enabled = true },
      -- Terminal column: editor background, same as a :terminal split. Snacks maps Normal to
      -- SnacksNormal (-> NormalFloat, the lighter float background) in every window it opens;
      -- floats like the picker keep that. The rest is snacks' default winhighlight.
      terminal = {
        win = {
          wo = {
            winhighlight = "WinBar:SnacksWinBar,WinBarNC:SnacksWinBarNC,WinSeparator:SnacksWinSeparator",
          },
        },
      },
    },
  },

  -- Sidebar tree (from the editor.neo-tree extra): show dotfiles, keep gitignored ones dimmed.
  -- File names keep the normal text color; git status shows only in the right-hand symbol.
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { width = 32 },
      default_component_configs = {
        name = { use_git_status_colors = false },
      },
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          never_show = { ".DS_Store" },
        },
      },
    },
  },
}
