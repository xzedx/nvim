-- since this is just an example spec, don't actually load anything here and return an empty spec
if true then
  return {
    {
      "catppuccin/nvim",
      name = "catppuccin",
    },
    -- Configure LazyVim to load gruvbox
    {
      "LazyVim/LazyVim",
      opts = {
        colorscheme = "catppuccin-latte",
      },
    },
    {
      "ahmedkhalf/project.nvim",
      opts = {
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
      "nvim-treesitter/nvim-treesitter-context",
    },
    {
      "nvim-treesitter/playground",
    },
    {
      "mbbill/undotree",
      config = function()
        vim.keymap.set("n", "<C-x>u", "<cmd>UndotreeToggle<cr><C-w>h")
      end,
    },
    {
      "NvChad/nvim-colorizer.lua",
      opts = {
        user_default_options = {
          tailwind = true,
        },
      },
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      -- optionally, override the default options:
      config = function()
        require("tailwindcss-colorizer-cmp").setup({
          color_square_width = 4,
        })
      end,
    },
    {
      "telescope.nvim",
      dependencies = {
        "nvim-telescope/telescope-live-grep-args.nvim",
        config = function()
          require("telescope").load_extension("live_grep_args")
        end,
        keys = {
          {
            "<leader>fg",
            ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
            desc = "Live grep args",
          },
        },
      },
    },

    -- {
    --   "nvim-telescope/telescope.nvim",
    --   --  keys = {
    --   --    {
    --   --      "<leader><space>",
    --   --      -- workaround for: https://github.com/LazyVim/LazyVim/issues/200
    --   --      function()
    --   --        require("telescope.builtin").git_files({
    --   --          no_ignore = true,
    --   --          hidden = true
    --   --        })
    --   --      end, desc = "Find Git Files (root dir)"
    --   --    },
    --   --  },
    --   dependencies = {
    --     "nvim-lua/plenary.nvim",
    --     "debugloop/telescope-undo.nvim",
    --   },
    --   config = function()
    --     require("telescope").setup({
    --       defaults = {
    --         file_ignore_patterns = { ".git" },
    --       },
    --       extensions = {
    --         file_browser = {
    --           -- disables netrw and use telescope-file-browser in its place
    --           hijack_netrw = true,
    --         },
    --         undo = {
    --           -- telescope-undo.nvim config, see below
    --         },
    --       },
    --     })
    --
    --     require("telescope").load_extension("undo")
    --     vim.keymap.set("n", "<C-x>u", "<cmd>Telescope undo<cr>")
    --   end,
    -- },
    -- {
    --   "zbirenbaum/copilot.lua",
    --   opts = {
    --     panel = {
    --       enabled = true,
    --       auto_refresh = false,
    --       keymap = {
    --         jump_prev = "[[",
    --         jump_next = "]]",
    --         accept = "<CR>",
    --         refresh = "gr",
    --         open = "<M-CR>",
    --       },
    --       layout = {
    --         position = "right", -- | top | left | right
    --         ratio = 0.4,
    --       },
    --     },
    --     -- suggestion = {
    --     --   enabled = true,
    --     --   auto_trigger = true,
    --     --   debounce = 75,
    --     --   -- keymap = {
    --     --   --   accept = "<M-l>",
    --     --   --   accept_word = false,
    --     --   --   accept_line = false,
    --     --   --   next = "<M-]>",
    --     --   --   prev = "<M-[>",
    --     --   --   dismiss = "<C-]>",
    --     --   -- },
    --     -- },
    --   },
    -- },
    {
      "supermaven-inc/supermaven-nvim",
      config = function()
        require("supermaven-nvim").setup({
          -- keymaps = {
          --   accept_suggestion = "<C-y>",
          --   clear_suggestion = "<C-]>",
          --   accept_word = "<C-j>",
          -- },
          -- -- ignore_filetypes = { cpp = true },
          -- color = {
          --   suggestion_color = "#ffffff",
          --   cterm = 244,
          -- },
          -- -- log_level = "info", -- set to "off" to disable logging completely
          -- -- disable_inline_completion = false, -- disables inline completion for use with cmp
          -- -- disable_keymaps = false, -- disables built in keymaps for more manual control
        })
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        default_component_configs = {
          icon = {
            folder_empty = "󰜌",
            folder_empty_open = "󰜌",
          },
          git_status = {
            symbols = {
              renamed = "󰁕",
              unstaged = "󰄱",
            },
          },
        },
        document_symbols = {
          kinds = {
            File = { icon = "󰈙", hl = "Tag" },
            Namespace = { icon = "󰌗", hl = "Include" },
            Package = { icon = "󰏖", hl = "Label" },
            Class = { icon = "󰌗", hl = "Include" },
            Property = { icon = "󰆧", hl = "@property" },
            Enum = { icon = "󰒻", hl = "@number" },
            Function = { icon = "󰊕", hl = "Function" },
            String = { icon = "󰀬", hl = "String" },
            Number = { icon = "󰎠", hl = "Number" },
            Array = { icon = "󰅪", hl = "Type" },
            Object = { icon = "󰅩", hl = "Type" },
            Key = { icon = "󰌋", hl = "" },
            Struct = { icon = "󰌗", hl = "Type" },
            Operator = { icon = "󰆕", hl = "Operator" },
            TypeParameter = { icon = "󰊄", hl = "Type" },
            StaticMethod = { icon = "󰠄 ", hl = "Function" },
          },
        },
        -- Add this section only if you've configured source selector.
        source_selector = {
          sources = {
            { source = "filesystem", display_name = " 󰉓 Files " },
            { source = "git_status", display_name = " 󰊢 Git " },
          },
        },
      },
    },
  }
end

-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  { "catppuccin/nvim", name = "catppuccin" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- add symbols-outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji", "supermaven-inc/supermaven-nvim" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" }, { name = "supermaven" } }))
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- add telescope-fzf-native
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },

  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- add tsserver and setup with typescript.nvim instead of lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").on_attach(function(_, buffer)
          -- stylua: ignore
          vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- tsserver will be automatically installed with mason and loaded with lspconfig
        tsserver = {},
      },
      -- you can do any additional lsp server setup here
      -- return true if you don't want this server to be setup with lspconfig
      ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
      setup = {
        -- example to setup with typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        -- Specify * to use this function as a fallback for any server
        -- ["*"] = function(server, opts) end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, "😄")
    end,
  },

  -- or you can return new options to override all the defaults
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      return {
        --[[add your custom lualine config here]]
      }
    end,
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
      },
    },
  },

  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  -- then: setup supertab in cmp
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     "hrsh7th/cmp-emoji",
  --   },
  --   ---@param opts cmp.ConfigSchema
  --   opts = function(_, opts)
  --     local has_words_before = function()
  --       unpack = unpack or table.unpack
  --       local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  --       return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  --     end

  --     local luasnip = require("luasnip")
  --     local cmp = require("cmp")

  --     opts.mapping = vim.tbl_extend("force", opts.mapping, {
  --       ["<Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_next_item()
  --           -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
  --           -- this way you will only jump inside the snippet region
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         elseif has_words_before() then
  --           cmp.complete()
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --       ["<S-Tab>"] = cmp.mapping(function(fallback)
  --         if cmp.visible() then
  --           cmp.select_prev_item()
  --         elseif luasnip.jumpable(-1) then
  --           luasnip.jump(-1)
  --         else
  --           fallback()
  --         end
  --       end, { "i", "s" }),
  --     })
  --   end,
  -- },
}
