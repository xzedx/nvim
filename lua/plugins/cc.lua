local toggle_key = "<C-,>"

return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  keys = {
    { "<leader>a", nil, desc = "AI/Claude Code" },
    { "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
    { "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
    { "<leader>ao", "<cmd>ClaudeCodeOpen<cr>", desc = "Open Claude" },
    {
      "<leader>as",
      "<cmd>ClaudeCodeTreeAdd<cr>",
      desc = "Add file",
      ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
    },
    -- Diff management
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
    -- Custom settings
    { "<C-,>", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code (Ctrl+,)", mode = { "n", "x" } },
    { "<M-,>", "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code (Alt+,)", mode = { "n", "x" } },
  },
  opts = {
    terminal = {
      auto_close = true,
      snacks_win_opts = {
      --   position = "float",
      --   width = 0.85,
      --   height = 0.85,
      --   border = "rounded",
      keys = {
        -- Multiple ways to hide from terminal mode
        claude_hide_ctrl = { "<C-,>", function(self) self:hide() end, mode = "t", desc = "Hide (Ctrl+,)" },
        claude_hide_alt = { "<M-,>", function(self) self:hide() end, mode = "t", desc = "Hide (Alt+,)" },
        claude_hide_esc = { "<C-\\><C-n>", function(self) self:hide() end, mode = "t", desc = "Hide (Ctrl+\\)" },
      },
      },
    },
    -- Diff Integration
    diff_opts = {
      keep_terminal_focus = true, -- If true, moves focus back to terminal after diff opens
    },
  }
}
