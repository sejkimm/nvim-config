-- Right-hand terminal column, like VSCode's panel on the right.
-- Terminals stack top to bottom in id order (1 on top). Keys live in lua/config/keymaps.lua.
local M = {}

local function id(term)
  return vim.b[term.buf].snacks_terminal.id
end

-- All terminals that belong to the column, shown or hidden, sorted by id.
local function column()
  local terms = vim.tbl_filter(function(t)
    return t.opts.position == "right"
  end, Snacks.terminal.list())
  table.sort(terms, function(a, b)
    return id(a) < id(b)
  end)
  return terms
end

local function shown(terms)
  return vim.tbl_filter(function(t)
    return t:win_valid()
  end, terms)
end

local function open(n)
  return Snacks.terminal.get(nil, { cwd = LazyVim.root(), count = n, win = { position = "right" } })
end

-- Snacks stacks each new window right under the top one; move them back into id order.
local function restack()
  local terms = shown(column())
  for i = 2, #terms do
    vim.fn.win_splitmove(terms[i].win, terms[i - 1].win, { rightbelow = true })
  end
end

--- Show or hide the whole column. Creates terminal 1 the first time.
function M.toggle()
  local terms = column()
  if #terms == 0 then
    return open(1)
  end
  if #shown(terms) > 0 then
    for _, t in ipairs(terms) do
      t:hide()
    end
    return
  end
  for _, t in ipairs(terms) do
    t:show()
  end
  restack()
  terms[1]:focus()
end

--- Add a terminal at the bottom of the column (shows the column first if hidden).
function M.new()
  local terms = column()
  if #terms > 0 and #shown(terms) == 0 then
    M.toggle()
  end
  local term = open(#terms == 0 and 1 or id(terms[#terms]) + 1)
  restack()
  term:focus()
end

return M
