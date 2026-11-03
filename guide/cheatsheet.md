# Neovim cheat sheet

The front side covers the workspace keys used every day; the back side covers keys to look up once those feel natural.
Keys match the actual config (LazyVim defaults + `lua/config/keymaps.lua`). Update this file whenever the config changes.

Notation

- `␣` = Space (leader). `␣ff` means Space, f, f in sequence.
- `Alt` = left Option. An uppercase letter as in `Alt-H` means Alt+Shift+h.
- Keys joined by a hyphen, as in `Ctrl-d`, are pressed together.

---

## Front: workspace

### 0. Basics

| Key | Meaning |
|---|---|
| Normal mode | The default state. Letters are commands, not text |
| Insert mode | Typing text. Enter with `i`, leave with `Esc` |
| `Esc` | When in doubt, press it. Returns to Normal mode |
| Korean input | Leaving Insert mode or the command line switches the input source to English. Switch back with the Han/Eng key |
| `␣` and wait | A menu of the keys that can follow (which-key) |
| `␣sk` | Search keys by name |

Key rule: `␣` opens feature menus, `Alt` handles windows (in every mode, even while typing), `Cmd` handles Ghostty panes, plain letters move and edit inside text. Directions are always `h` left, `j` down, `k` up, `l` right.

### 1. Open, save, quit

| Key | Action |
|---|---|
| `nvim .` | Open the current folder as a workspace (from the shell) |
| `Ctrl-s` | Save |
| `:q` | Close the current window |
| `:q!` | Close without saving |
| `␣qq` | Quit everything |
| `␣qs` | Restore the last window layout and files for this folder |
| `␣ql` | Restore the most recent session (any folder) |

### 2. Find files, sidebar

| Key | Action |
|---|---|
| `␣e` | Open / close the sidebar tree |
| `␣␣` | Find files by name |
| `␣/` | Search text across the project (grep) |
| `␣fr` | Recent files |
| `␣,` | Files open right now |

In a picker: typing filters at once, `Ctrl-j` `Ctrl-k` move down / up, `Enter` opens, `Esc` closes.

In the sidebar tree: `Enter` opens a file or expands a folder, `a` new file (a trailing `/` makes a folder), `r` rename, `d` delete, `?` key help.

### 3. Split and move between windows

| Key | Action |
|---|---|
| `␣wv` | Split vertically (new window on the right) |
| `␣ws` | Split horizontally (new window below) |
| `Alt-h` `Alt-j` `Alt-k` `Alt-l` | Move to the window left / below / above / right (also while typing; typing stops) |
| `Alt-H` `Alt-J` `Alt-K` `Alt-L` | Push the window border in that direction (resize, the mode stays) |
| `␣w=` | Make windows equal size (the tree keeps its width) |
| `␣wm` or `Alt-m` | Zoom the current window and back (`Alt-m` also works while typing) |
| `␣wd` | Close the current window |
| `␣wo` | Close all other windows |

### 4. Shells (Ghostty panes)

Neovim is the code editor in one Ghostty pane. Shells live in other Ghostty panes, so quitting Neovim leaves them running. These are Ghostty's default keys.

| Key | Action |
|---|---|
| `Cmd-d` | New pane on the right |
| `Cmd-Shift-d` | New pane below |
| `Cmd-[` `Cmd-]` | Previous / next pane |
| `Cmd-Option-arrows` | Move to the pane in that direction |
| `Cmd-Ctrl-arrows` | Resize the pane |
| `Cmd-Ctrl-=` | Make panes equal size |
| `Cmd-Shift-Enter` | Zoom the current pane and back |
| `Cmd-w` | Close the current pane |

### 5. Open files (buffers)

There is no tab strip at the top. Open files (buffers) form one global list that belongs to no window: showing a file in two windows means viewing one file in two places, and an edit in one shows up in the other. A line at the top of each window (winbar) shows its file name, with `[+]` after unsaved changes.

| Key | Action |
|---|---|
| `␣,` | Pick an open file and show it in the current window |
| `Shift-h` `Shift-l` | Previous / next file (in list order) |
| `␣bd` | Close the current file (keep the window) |
| `␣bo` | Close all other files |

### 6. Read and move

| Key | Action |
|---|---|
| `h` `j` `k` `l` | left, down, up, right |
| `w` `b` | Next / previous word |
| `0` `$` | Start / end of line |
| `gg` `G` | Start / end of file |
| `Ctrl-d` `Ctrl-u` | Half a page down / up |
| `zz` | Center the current line on screen |
| `/text` `Enter` | Search in the file |
| `n` `N` | Next / previous match |
| `*` | Search the word under the cursor |
| `gd` | Go to definition |
| `Ctrl-o` | Jump back to the previous position (after `gd`) |
| `K` | Show documentation |
| `gr` | List places that use this name |

### 7. Basic editing

| Key | Action |
|---|---|
| `i` `a` | Start typing before / after the cursor |
| `o` `O` | Open a new line below / above and type |
| `Esc` | Stop typing |
| `u` `Ctrl-r` | Undo / redo |
| `v` `V` | Start selecting by character / by line |
| `y` | Copy (shared with the macOS clipboard) |
| `d` | Cut (the selection) |
| `p` | Paste |
| `dd` `yy` | Cut / copy one line |
| `x` | Delete one character |
| `.` | Repeat the last edit |
| `gcc` | Toggle comment on one line (`gc` on a selection) |
| `Alt-Backspace` | Delete a word while typing |

---

## Back: once the basics feel natural

### Editing grammar

Combine as `[count] operator target`. Examples: `d3w` deletes 3 words, `ci"` changes inside quotes, `yap` copies a paragraph.

| Key | Action |
|---|---|
| `d` `c` `y` | Delete / change / copy |
| `>` `<` `=` | Indent / outdent / reformat |
| `gU` `gu` `~` | Uppercase / lowercase / toggle case |
| `r` char | Replace one character |
| `I` `A` | Type at start / end of line |
| `Ctrl-v` | Block (column) selection |
| `:%s/a/b/gc` | Replace in the whole file, confirming each |

### Text objects (i = inside, a = around)

| Key | Target |
|---|---|
| `iw` `aw` | Word |
| `i"` `i'` `` i` `` | Inside quotes |
| `i(` `i[` `i{` | Inside brackets |
| `it` `at` | HTML/XML tag |
| `ip` `ap` | Paragraph |
| `if` `af` | Function |
| `ic` `ac` | Class |

### More movement

| Key | Action |
|---|---|
| `e` | End of word |
| `W` `B` | Whitespace-separated word |
| `^` | First character of the line |
| `f`x `F`x | To the next / previous x on the line |
| `t`x `T`x | Up to just before x |
| `;` `,` | Repeat f/t / in reverse |
| `{` `}` | Previous / next blank line |
| `%` | Matching bracket |
| `42G` | Line 42 |
| `Ctrl-f` `Ctrl-b` | One page down / up |
| `H` `M` `L` | Top / middle / bottom of the screen |
| `zt` `zb` | Current line to the top / bottom of the screen |
| `Alt-e` `Alt-y` | Scroll one line, cursor stays (also while typing) |
| `s` + chars | Jump anywhere on screen by label (flash) |
| `Ctrl-i` | Next position (opposite of `Ctrl-o`) |

### Marks, registers, macros

| Key | Action |
|---|---|
| `m`a | Set mark a at the current position |
| `` ` ``a | Go to mark a |
| `m`A | Uppercase marks work across files |
| `g;` | Go to the last change |
| `"`ay | Copy into register a |
| `:reg` | List registers |
| `q`a … `q` | Record macro a |
| `@`a `@@` | Run macro a / repeat |

### Reading code (LSP)

| Key | Action |
|---|---|
| `gI` `gy` | Implementation / type definition |
| `gD` | Declaration |
| `gK` | Function signature |
| `]]` `[[` | Next / previous use of the same name |
| `␣ss` `␣sS` | Search symbols in the file / project |
| `␣cs` | Symbol outline |
| `]d` `[d` | Next / previous diagnostic |
| `␣xx` | Diagnostics list |
| `␣cr` | Rename |
| `␣ca` | Code action |

### More search

| Key | Action |
|---|---|
| `␣sw` | Grep the project for the word under the cursor |
| `␣sr` | Search and replace across the project |
| `␣fc` | Find config files |
| `Alt-q` | Send picker results to the quickfix list |
| `]q` `[q` | Next / previous quickfix item |

### More sidebar tree

| Key | Action |
|---|---|
| `␣E` | Tree for the current working directory |
| `␣ge` | Tree of git-changed files |
| `s` `S` `t` | Open in a vertical split / horizontal split / tab |
| `P` | Toggle preview |
| `H` | Toggle hidden files |
| `/` | Filter the tree |
| `.` `Backspace` | Make this the root / go up |

### Folding

| Key | Action |
|---|---|
| `za` | Toggle the current fold |
| `zM` `zR` | Close all / open all folds |
| `zj` `zk` | Next / previous fold |

### Git

| Key | Action |
|---|---|
| `␣gg` | lazygit |
| `␣gb` | Blame the current line |
| `␣gB` | Open on GitHub |
| `]h` `[h` | Next / previous changed hunk |
| `␣ghp` | Preview hunk |

### Markdown

| Key | Action |
|---|---|
| `␣um` | Toggle in-buffer rendering |
| `␣cp` | Browser preview |

### More windows

| Key | Action |
|---|---|
| `Alt-n` `Alt-p` | In code with LSP: next / previous reference of the word under the cursor |
| `␣w` and wait | Full list of window commands |
| `␣uz` | Zen mode (focused reading) |
| `␣<Tab><Tab>` | New tab (a whole extra window layout) |
| `gt` `gT` | Next / previous tab |

### Toggles (␣u)

| Key | Action |
|---|---|
| `␣uw` | Line wrap |
| `␣ul` `␣uL` | Line numbers / relative numbers |
| `␣uh` | Inlay hints |
| `␣uf` | Format on save (off by default) |

### Maintenance and help

| Key | Action |
|---|---|
| `␣l` | Lazy (plugin updates) |
| `:LazyExtras` | Enable language and feature extras |
| `:LazyHealth` | Full health check |
| `:h` topic | Built-in help |
| `:Tutor` | Built-in tutorial |

### Keys that differ from common guides

Keys from general Vim/LazyVim guides that this config changes.

| Key in guides | This config |
|---|---|
| `Ctrl-w` + command (windows) | `␣w` + command |
| `Ctrl-h/j/k/l` (move between windows) | `Alt-h/j/k/l` |
| `Ctrl-arrows` (resize windows) | `Alt-H/J/K/L` |
| `␣-` `␣|` (split windows) | `␣ws` `␣wv` |
| `␣ft` `Ctrl-/` (terminal) | Removed. Shells live in Ghostty panes (`Cmd-d`) |
| `Ctrl-e` `Ctrl-y` (scroll one line) | `Alt-e` `Alt-y` |
| `Ctrl-w` (delete a word while typing) | `Alt-Backspace` |
