# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a LazyVim-based Neovim configuration that extends the base LazyVim setup with custom plugins and configurations. The configuration is structured using lazy.nvim's plugin management system.

## Architecture

### Entry Point
- `init.lua` - Bootstraps lazy.nvim and loads the configuration via `require("config.lazy")`

### Configuration Structure
```
lua/
├── config/           # Core configuration files
│   ├── lazy.lua      # Plugin loader and LazyVim setup
│   ├── options.lua   # Vim options and settings
│   ├── keymaps.lua   # Custom key mappings
│   └── autocmds.lua  # Auto commands
└── plugins/          # Plugin specifications (automatically loaded by lazy.nvim)
    ├── example.lua           # Main plugin configurations (despite filename)
    ├── cc.lua                # Claude Code integration
    ├── ui.lua                # UI customizations (currently empty)
    └── telescope-file-browser.lua  # Telescope file browser setup
```

### Plugin System
- Plugins are defined in `lua/plugins/*.lua` and automatically loaded by lazy.nvim
- Each plugin file returns a table of plugin specifications
- LazyVim extras are imported in `lua/config/lazy.lua` (TypeScript, JSON, Prettier, Tailwind, ESLint, etc.)
- Plugin configurations use the `opts` table to override defaults or `config` function for custom setup

### Key Plugin Configurations

**Active plugins (in lua/plugins/example.lua):**
- Colorscheme: Catppuccin
- Project detection: project.nvim (pattern-based, .git only)
- Treesitter: Includes prisma, treesitter-context, playground
- Undotree: Mapped to `<C-x>u`
- Colorizer: NvChad colorizer with Tailwind support
- Telescope: Live grep args extension
- AI: Supermaven (active), Copilot (commented out)
- Neo-tree: Custom icons and git status symbols
- Completion: nvim-cmp with emoji and Supermaven sources

**Claude Code integration (lua/plugins/cc.lua):**
- Primary toggle: `<C-,>` or `<M-,>` (Ctrl/Alt + comma)
- Leader mappings under `<leader>a` prefix for various Claude operations
- Diff management: `<leader>aa` (accept), `<leader>ad` (deny)
- Auto-closes terminal after operations

### Custom Keymaps (lua/config/keymaps.lua)

**Emacs-style insert mode bindings:**
- `<C-n>`, `<C-p>`, `<C-b>`, `<C-f>`: Navigation
- `<C-a>`, `<C-e>`: Home/End
- `<C-d>`: Delete
- `<C-/>`: Undo

**Normal mode:**
- `<M-h/j/k/l>`: Window navigation
- `<C-d>`, `<C-u>`: Half-page scroll with centering
- `n`, `N`: Search with centering
- `J`: Join lines preserving cursor position
- `K`: Insert line above preserving cursor position
- `<leader>cx`: Make file executable

**Neovide-specific (GUI):**
- `<D-s>`: Save
- `<D-c>`, `<D-v>`: Copy/paste using system clipboard

### Telescope Configuration
- Layout: Horizontal with prompt at top
- Sorting: Ascending
- Live grep args extension available at `<leader>fg`
- File browser extension at `<leader>FF`

## Development Workflow

### Managing Plugins
- Add new plugin specs to existing files in `lua/plugins/` or create new files
- Plugin specs are Lua tables with plugin name and optional `opts`, `config`, `dependencies`, `keys`, etc.
- Run `:Lazy` to manage plugins (install, update, clean)
- `:Lazy check` to check for updates

### Keymapping
- Add keymaps in `lua/config/keymaps.lua` using the provided `map()` function
- The `map()` function checks for lazy.nvim key handlers to avoid conflicts
- For plugin-specific keymaps, define them in the plugin spec's `keys` table

### LSP Configuration
- LSP servers configured via `neovim/nvim-lspconfig` plugin specs
- Add servers to the `servers` table in the plugin's `opts`
- Use `setup` table for custom server initialization (e.g., typescript.nvim)

### Treesitter Parsers
- Add to `ensure_installed` in nvim-treesitter plugin spec
- Use `vim.list_extend()` to append to existing parsers without overwriting

### Mason Tools
- Add tools to `ensure_installed` in williamboman/mason.nvim plugin spec

## LazyVim Integration

This config extends LazyVim, which provides:
- Default keymaps: See https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
- Default options: See https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
- Default autocmds: See https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
- Extra modules imported: TypeScript, JSON, Prettier, Tailwind, ESLint, Project utils

## Important Notes

- The file `lua/plugins/example.lua` contains the primary plugin configurations (not just examples)
- The top portion of `example.lua` (lines 1-221) is wrapped in `if true then` and contains active configs
- The bottom portion (lines 230-487) contains additional examples and commented code for reference
- Supermaven is the active AI completion provider; Copilot config is present but commented out
- Project root detection uses only `.git` pattern, not LSP or package.json