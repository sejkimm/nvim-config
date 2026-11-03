-- Markdown reading.
--   render-markdown.nvim (from LazyVim's lang.markdown extra) renders in place;
--   raw text reappears only on the cursor line.   toggle: <leader>um
--   Browser preview (markdown-preview.nvim, same extra): <leader>cp, styled with noeul.css
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      checkbox = { enabled = true }, -- LazyVim turns this off; useful for Obsidian notes
      bullet = { enabled = false }, -- show list markers as typed (-, *, +) instead of circles
      heading = {
        -- Hide the '#' marks so heading text lines up with body text.
        -- LazyVim sets icons = {} (no icon), which leaves '## ' visible and pushes the text right.
        -- An empty icon with position 'inline' conceals the marks.
        icons = { "" },
        position = "inline",
        -- No colored bar across the whole line (default borrows DiffText/DiffAdd/... colors).
        -- "RenderMarkdownHeadingPlain" is never defined, so the line keeps the editor background
        -- and the colorscheme's own heading color (noeul: one color per level).
        -- ("Normal" would also reset the text color.) All six levels are listed because a
        -- shorter list keeps the defaults for the remaining levels.
        backgrounds = {
          "RenderMarkdownHeadingPlain", "RenderMarkdownHeadingPlain", "RenderMarkdownHeadingPlain",
          "RenderMarkdownHeadingPlain", "RenderMarkdownHeadingPlain", "RenderMarkdownHeadingPlain",
        },
      },
    },
  },

  -- Browser preview (<leader>cp) styled with noeul.css.
  -- The plugin accepts a single custom CSS file, so join noeul.css (shipped with the noeul
  -- colorscheme plugin) and css/markdown-preview.css (layout adapter) at startup.
  -- Used for both the page style and code highlighting (noeul.css styles highlight.js).
  {
    "iamcco/markdown-preview.nvim",
    optional = true,
    init = function()
      local sources = {
        LazyVim.get_plugin_path("noeul", "web/noeul.css") or "noeul plugin (web/noeul.css)",
        vim.fn.stdpath("config") .. "/css/markdown-preview.css",
      }
      local parts = {}
      for _, path in ipairs(sources) do
        local f = io.open(path, "r")
        if not f then
          vim.notify("markdown preview: missing " .. path, vim.log.levels.ERROR)
          return
        end
        parts[#parts + 1] = f:read("*a")
        f:close()
      end
      local out = vim.fn.stdpath("cache") .. "/markdown-preview.css"
      local f = assert(io.open(out, "w"))
      f:write(table.concat(parts, "\n"))
      f:close()
      vim.g.mkdp_markdown_css = out
      vim.g.mkdp_highlight_css = out
    end,
  },

  -- Reading, not writing: no markdownlint diagnostics on notes.
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = { linters_by_ft = { markdown = {} } },
  },
}
