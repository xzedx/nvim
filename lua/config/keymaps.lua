-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- local map = LazyVim.safe_keymap_set

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Emacs-style keybindings.
map("i", "<C-n>", "<Down>")
map("i", "<C-p>", "<Up>")
map("i", "<C-b>", "<Left>")
map("i", "<C-f>", "<Right>")
map("i", "<C-a>", "<Home>")
map("i", "<C-e>", "<End>")
map("i", "<C-d>", "<Del>")
map("i", "<C-l>", "<C-o>zz")
map("i", "<C-/>", "<C-o>u")

-- Normal
map("n", "<M-h>", "<C-w>h")
map("n", "<M-j>", "<C-w>j")
map("n", "<M-k>", "<C-w>k")
map("n", "<M-l>", "<C-w>l")
-- map("n", "<C-l>", "zz")
map("n", "<C-a>", "^")

map("n", "J", "mzJ`z")
map("n", "K", "mzO<Esc>`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>cx", "<cmd>!chmod +x %<CR>")



-- Neovide specific
if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste in normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste in visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste in command-line mode
  -- vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste in insert mode
  vim.keymap.set('i', '<D-v>', '<C-R>+') -- Paste in insert mode
end


