return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
      detection_methods = { "pattern" },
      patterns = { ".git" },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "prisma",
      },
    },
  },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<C-x>u", "<cmd>UndotreeToggle<cr><C-w>h")
    end,
  },
  {
    "catgoose/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
}
