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
    ├── colorscheme.lua   # Catppuccin
    ├── editor.lua        # project.nvim, treesitter (prisma), undotree, colorizer
    ├── ai.lua            # Supermaven
    └── cc.lua            # Claude Code integration
```

### Plugin System
- Plugins are defined in `lua/plugins/*.lua` and automatically loaded by lazy.nvim
- Each plugin file returns a table of plugin specifications
- LazyVim extras are managed only in `lazyvim.json` (edit via `:LazyExtras`), not in `lua/config/lazy.lua`
- Picker and file explorer are both snacks (`editor.snacks_picker`, `editor.snacks_explorer` extras); neo-tree, fzf-lua and telescope are not installed
- Plugin configurations use the `opts` table to override defaults or `config` function for custom setup

### Key Plugin Configurations
- Colorscheme: Catppuccin
- Project detection: project.nvim (pattern-based, .git only)
- Treesitter: prisma parser; treesitter-context via `ui.treesitter-context` extra (`<leader>ut` toggles)
- Undotree: Mapped to `<C-x>u`
- Colorizer: nvim-colorizer.lua with Tailwind support
- AI: Supermaven
- Completion: blink.cmp (LazyVim default)

**Claude Code integration (lua/plugins/cc.lua):**
- Primary toggle: `<C-,>` or `<M-,>` (Ctrl/Alt + comma)
- Leader mappings under `<leader>a` prefix for various Claude operations
- Diff management: `<leader>aa` (accept), `<leader>ad` (deny)
- `<leader>as` in the snacks explorer adds the file under cursor
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
