local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand("%:p:h")
end

return {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").load_extension("file_browser")

    vim.keymap.set("n", "<leader>FF", function()
      telescope.extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = telescope_buffer_dir(),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 },
      })
    end, { desc = "File Browser" })
  end,
}
