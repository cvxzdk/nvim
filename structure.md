# Project Structure

Generated: 2026-07-17 19:24:56

## Directory Tree

```
nvim/
├── after/
│   └── plugin/
│       └── colors.lua
├── lua/
│   ├── config.lua
│   └── keymap.lua
├── plugins/
│   ├── autopairs.lua
│   ├── bufferline.lua
│   ├── cmp.lua
│   ├── gitsigns.lua
│   ├── harpoon.lua
│   ├── lsp.lua
│   ├── lualine.lua
│   ├── markdown-preview.lua
│   ├── nvim-tree.lua
│   ├── oil.lua
│   ├── telescope.lua
│   ├── treesitter.lua
│   ├── trouble.lua
│   └── which-key.lua
├── ctx.py
├── init.lua
├── install.sh
└── project_structure.md
```

---

# File Contents

## `after\plugin\colors.lua`

```
require("onedark").setup({
  style = "darker",
  colors = {
    bg0 = "#0d1117",
    bg1 = "#11161e",
    bg2 = "#161b24",
    bg3 = "#1a2030",
  },
})
require("onedark").load()
```

## `lua\config.lua`

```
-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false
vim.opt.wrap = false

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- System
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
```

## `lua\keymap.lua`

```
-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Stay in visual mode when pasting
keymap("x", "p", '"_dP', { desc = "Paste without yanking" })

-- Clear search highlight
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fr", "<cmd>Telescope frecency<cr>", { desc = "Find files (frecency)" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- Harpoon
local harpoon = require("harpoon")
keymap("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon: add file" })
keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon: menu" })
keymap("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon: file 1" })
keymap("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon: file 2" })
keymap("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon: file 3" })
keymap("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon: file 4" })

-- Trouble
keymap("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
keymap("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Quickfix (Trouble)" })

-- Bufferline (tabs)
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer/tab" })
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer/tab" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Close buffer/tab" })

-- Markdown preview
keymap("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Markdown Preview (browser)" })

-- ═══ OPTIONAL: nvim-tree keymap, delete if you remove the plugin ═══
keymap("n", "-", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })

-- Scrolling
keymap("n", "<A-l>", "zL", { desc = "Scroll right" })
keymap("n", "<A-h>", "zH", { desc = "Scroll left" })
```

## `plugins\autopairs.lua`

```
require('nvim-autopairs').setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
})
```

## `plugins\bufferline.lua`

```
require("bufferline").setup({
  options = {
    mode = "buffers",       -- shows open buffers as tabs across the top
    diagnostics = "nvim_lsp",
    separator_style = "slant",
    show_buffer_close_icons = true,
    show_close_icon = false,
    always_show_bufferline = true,
  },
})
```

## `plugins\cmp.lua`

```
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})
```

## `plugins\gitsigns.lua`

```
require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
})
```

## `plugins\harpoon.lua`

```
local harpoon = require("harpoon")
harpoon:setup()
```

## `plugins\lsp.lua`

```
-- Setup Mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Get capabilities for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
})

-- Python
vim.lsp.config('pyright', {
  capabilities = capabilities,
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
})

-- JavaScript/TypeScript
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

-- Enable the servers
vim.lsp.enable({'lua_ls', 'pyright', 'ts_ls'})
```

## `plugins\lualine.lua`

```
require("lualine").setup({
  options = {
    theme = "iceberg_dark",
    component_separators = "|",
    section_separators = "",
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
})
```

## `plugins\markdown-preview.lua`

```
vim.g.mkdp_auto_close = 1
vim.g.mkdp_browser = ""  -- empty = use system default browser
```

## `plugins\nvim-tree.lua`

```
-- ═══════════════════════════════════════════════════════
-- OPTIONAL: nvim-tree file sidebar
-- Delete this file + its `require('plugins.nvim-tree')` line
-- in init.lua, plus its keymap in keymap.lua, to remove.
-- ═══════════════════════════════════════════════════════
require("nvim-tree").setup({
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
})
```

## `plugins\oil.lua`

```
require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["g."] = "actions.toggle_hidden",
  },
})
```

## `plugins\telescope.lua`

```
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
  },
  extensions = {
    frecency = {
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
    },
  },
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')
```

## `plugins\treesitter.lua`

```
require('nvim-treesitter.config').setup({
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  
  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
})
```

## `plugins\trouble.lua`

```
require("trouble").setup({})
```

## `plugins\which-key.lua`

```
require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true,
    },
  },
})
```

## `ctx.py`

````python
from pathlib import Path
from datetime import datetime
import fnmatch
import argparse
import re


# --- Config -------------------------------------------------------------------

LANG_MAP = {
    ".js": "javascript", ".ts": "typescript", ".tsx": "typescriptreact",
    ".jsx": "javascriptreact", ".svelte": "svelte", ".vue": "vue",
    ".html": "html", ".css": "css", ".scss": "scss", ".less": "less",
    ".json": "json", ".yaml": "yaml", ".yml": "yaml", ".toml": "toml",
    ".py": "python", ".rb": "ruby", ".rs": "rust", ".go": "go",
    ".c": "c", ".cpp": "cpp", ".h": "c", ".java": "java",
    ".sh": "bash", ".bash": "bash", ".zsh": "bash",
    ".sql": "sql", ".md": "markdown", ".xml": "xml", ".tf": "hcl",
}


# --- Gitignore ----------------------------------------------------------------

def load_gitignore_patterns(root: Path) -> list[tuple[Path, str]]:
    """Load patterns from all .gitignore files found at root and its parents."""
    patterns: list[tuple[Path, str]] = []

    for directory in [root] + list(root.parents):
        gi = directory / ".gitignore"
        if gi.exists():
            try:
                for line in gi.read_text(encoding="utf-8").splitlines():
                    line = line.strip()
                    if line and not line.startswith("#"):
                        patterns.append((directory, line))
            except OSError:
                pass

    return patterns


def is_ignored(path: Path, root: Path, patterns: list[tuple[Path, str]], output_name: str) -> bool:
    """Check if a path should be excluded from the export."""
    name = path.name

    if name.startswith(".") or name == output_name:
        return True

    for base_dir, pat in patterns:
        try:
            rel = path.relative_to(base_dir)
        except ValueError:
            continue

        rel_str = rel.as_posix()
        parts = rel_str.split("/")

        is_dir_pat = pat.endswith("/")
        clean_pat = pat.rstrip("/")

        for target in [name, rel_str] + parts:
            if fnmatch.fnmatch(target, clean_pat):
                if is_dir_pat and not path.is_dir():
                    continue
                return True

    return False


# --- Tree builder -------------------------------------------------------------

def build_tree(
    root: Path,
    patterns: list[tuple[Path, str]],
    output_name: str,
) -> tuple[list[str], list[Path]]:
    """Walk the directory tree, returning the ASCII tree lines and file list."""
    lines = [f"{root.name}/"]
    files: list[Path] = []

    def _walk(p: Path, prefix: str) -> None:
        try:
            items = sorted(p.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower()))
        except PermissionError:
            return

        items = [x for x in items if not is_ignored(x, root, patterns, output_name)]

        for i, item in enumerate(items):
            is_last = i == len(items) - 1
            connector = "└── " if is_last else "├── "
            lines.append(f"{prefix}{connector}{item.name}{'/' if item.is_dir() else ''}")

            if item.is_dir():
                _walk(item, prefix + ("    " if is_last else "│   "))
            else:
                files.append(item)

    _walk(root, "")
    return lines, files


# --- Markdown rendering -------------------------------------------------------

def make_fence(content: str) -> str:
    """Return the shortest code fence that won't clash with content."""
    max_ticks = max(
        (len(m) for m in re.findall(r"`+", content)),
        default=2,
    )
    return "`" * max(3, max_ticks + 1)


def render_file_section(f: Path, root: Path) -> list[str]:
    """Render a single file as a markdown section."""
    rel = f.relative_to(root)
    print(f"  Reading {rel}...")
    lang = LANG_MAP.get(f.suffix.lower(), "")
    lines = [f"## `{rel}`", ""]

    try:
        raw = f.read_bytes()
        if b"\x00" in raw[:8192]:
            lines += ["> ⚠️ Skipped: binary file", ""]
            return lines
        content = raw.decode("utf-8")
    except UnicodeDecodeError:
        lines += ["> ⚠️ Skipped: non-UTF-8 encoding", ""]
        return lines
    except OSError as e:
        lines += [f"> ⚠️ Error reading file: {e}", ""]
        return lines

    fence = make_fence(content)
    lines += [f"{fence}{lang}", content.rstrip(), fence, ""]
    return lines


# --- Main export --------------------------------------------------------------

def export_tree_to_md(path: str = ".", output_name: str = "structure.md", tree_only: bool = False) -> None:
    root = Path(path).resolve()

    if not root.is_dir():
        raise NotADirectoryError(f"Not a directory: {root}")

    patterns = load_gitignore_patterns(root)
    tree_lines, files = build_tree(root, patterns, output_name)

    md: list[str] = [
        "# Project Structure",
        "",
        f"Generated: {datetime.now():%Y-%m-%d %H:%M:%S}",
        "",
        "## Directory Tree",
        "",
        "```",
        *tree_lines,
        "```",
        "",
    ]

    if not tree_only:
        md += [
            "---",
            "",
            "# File Contents",
            "",
        ]
        for f in files:
            md.extend(render_file_section(f, root))

    out = root / output_name
    out.write_text("\n".join(md), encoding="utf-8")

    print(f"✓ Exported to:  {out}")
    print(f"  Files included: {0 if tree_only else len(files)}")


# --- CLI ----------------------------------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export a project tree + file contents to Markdown.")
    subparsers = parser.add_subparsers(dest="command")

    # Full export (default)
    full_parser = subparsers.add_parser("full", help="Export tree + file contents (default)")
    full_parser.add_argument("path", nargs="?", default=".", help="Root directory (default: current dir)")
    full_parser.add_argument("-o", "--output", default="structure.md", help="Output filename")

    # Tree only
    tree_parser = subparsers.add_parser("tree", help="Export directory tree only")
    tree_parser.add_argument("path", nargs="?", default=".", help="Root directory (default: current dir)")
    tree_parser.add_argument("-o", "--output", default="structure.md", help="Output filename")

    args = parser.parse_args()

    # Default to full if no subcommand given
    if args.command == "tree":
        export_tree_to_md(args.path, args.output, tree_only=True)
    else:
        path = getattr(args, "path", ".")
        output = getattr(args, "output", "structure.md")
        export_tree_to_md(path, output)
````

## `init.lua`

```
-- Ensure pack plugins are loaded (Windows compatible)
local pack_path = vim.fn.stdpath('config') .. '\\pack\\x\\start'
vim.opt.packpath:prepend(vim.fn.stdpath('config'))

-- Add lua paths for Windows
local config_path = vim.fn.stdpath('config')
package.path = package.path .. ';' .. config_path .. '\\?.lua'
package.path = package.path .. ';' .. config_path .. '\\lua\\?.lua'

require('config')
require('keymap')

-- Load plugin configs
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.which-key')
require('plugins.autopairs')
require('plugins.harpoon')
require('plugins.trouble')
require('plugins.bufferline')
require('plugins.markdown-preview')

-- ═══ OPTIONAL: remove this one line to drop nvim-tree entirely ═══
require('plugins.nvim-tree')
```

## `install.sh`

```bash
#!/bin/bash

PACK_DIR="$HOME/AppData/Local/nvim/pack/x/start"
mkdir -p "$PACK_DIR"
cd "$PACK_DIR" || exit

echo "Installing Neovim plugins to $PACK_DIR..."

echo "Cloning nvim-treesitter..."
git clone https://github.com/nvim-treesitter/nvim-treesitter

echo "Cloning nvim-lspconfig..."
git clone https://github.com/neovim/nvim-lspconfig

echo "Cloning mason.nvim..."
git clone https://github.com/williamboman/mason.nvim

echo "Cloning nvim-cmp..."
git clone https://github.com/hrsh7th/nvim-cmp

echo "Cloning cmp-nvim-lsp..."
git clone https://github.com/hrsh7th/cmp-nvim-lsp

echo "Cloning cmp-buffer..."
git clone https://github.com/hrsh7th/cmp-buffer

echo "Cloning telescope.nvim..."
git clone https://github.com/nvim-telescope/telescope.nvim

echo "Cloning plenary.nvim..."
git clone https://github.com/nvim-lua/plenary.nvim

echo "Cloning onedark.nvim..."
git clone https://github.com/navarasu/onedark.nvim

echo "Cloning gitsigns.nvim..."
git clone https://github.com/lewis6991/gitsigns.nvim

echo "Cloning lualine.nvim..."
git clone https://github.com/nvim-lualine/lualine.nvim

echo "Cloning which-key.nvim..."
git clone https://github.com/folke/which-key.nvim

echo "Cloning nvim-autopairs..."
git clone https://github.com/windwp/nvim-autopairs

echo "Cloning harpoon (harpoon2 branch)..."
git clone --branch harpoon2 https://github.com/ThePrimeagen/harpoon

echo "Cloning telescope-fzf-native..."
git clone https://github.com/nvim-telescope/telescope-fzf-native.nvim
(cd telescope-fzf-native.nvim && make)

echo "Cloning telescope-frecency..."
git clone https://github.com/nvim-telescope/telescope-frecency.nvim

echo "Cloning sqlite.lua (frecency dependency)..."
git clone https://github.com/kkharji/sqlite.lua

echo "Cloning trouble.nvim..."
git clone https://github.com/folke/trouble.nvim

echo "Cloning nvim-web-devicons (trouble/nvim-tree dependency)..."
git clone https://github.com/nvim-tree/nvim-web-devicons

echo "Cloning nvim-tree.lua..."
git clone https://github.com/nvim-tree/nvim-tree.lua

echo "Cloning bufferline.nvim (tabs)..."
git clone https://github.com/akinsho/bufferline.nvim

echo "Cloning markdown-preview.nvim..."
git clone https://github.com/iamcco/markdown-preview.nvim
(cd markdown-preview.nvim/app && npm install)

echo "Done! All plugins installed."
```

## `project_structure.md`

`````markdown
# Project Structure

Generated: 2026-04-26 20:13:03

## Directory Tree

```
nvim/
├── after/
│   └── plugin/
│       └── colors.lua
├── lua/
│   ├── config.lua
│   └── keymap.lua
├── plugins/
│   ├── autopairs.lua
│   ├── cmp.lua
│   ├── gitsigns.lua
│   ├── lsp.lua
│   ├── lualine.lua
│   ├── oil.lua
│   ├── telescope.lua
│   ├── treesitter.lua
│   └── which-key.lua
├── ctx.py
├── init.lua
└── install.sh
```

---

# File Contents

## `after\plugin\colors.lua`

```
require("onedark").setup({
  style = 'darker'
})
require("onedark").load()
```

## `lua\config.lua`

```
-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.showmode = false

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- System
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Scrolling
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
```

## `lua\keymap.lua`

```
-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Resize windows
keymap("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- Better indenting
keymap("v", "<", "<gv", { desc = "Indent left" })
keymap("v", ">", ">gv", { desc = "Indent right" })

-- Move text up and down
keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move text down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move text up" })

-- Stay in visual mode when pasting
keymap("x", "p", '"_dP', { desc = "Paste without yanking" })

-- Clear search highlight
keymap("n", "<Esc>", ":noh<CR>", { desc = "Clear search highlight" })

-- Oil file manager
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open file manager" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
```

## `plugins\autopairs.lua`

```
require('nvim-autopairs').setup({
  check_ts = true,
  disable_filetype = { "TelescopePrompt" },
})
```

## `plugins\cmp.lua`

```
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})
```

## `plugins\gitsigns.lua`

```
require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
})
```

## `plugins\lsp.lua`

```
-- Setup Mason
require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- Get capabilities for LSP
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Lua
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  root_markers = { '.luarc.json', '.luarc.jsonc', '.luacheckrc', '.stylua.toml', 'stylua.toml', 'selene.toml', 'selene.yml', '.git' },
})

-- Python
vim.lsp.config('pyright', {
  capabilities = capabilities,
  root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
})

-- JavaScript/TypeScript
vim.lsp.config('ts_ls', {
  capabilities = capabilities,
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
})

-- Enable the servers
vim.lsp.enable({'lua_ls', 'pyright', 'ts_ls'})
```

## `plugins\lualine.lua`

```
require('lualine').setup({
  options = {
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})
```

## `plugins\oil.lua`

```
require("oil").setup({
  default_file_explorer = true,
  columns = {
    "icon",
  },
  view_options = {
    show_hidden = true,
  },
  keymaps = {
    ["g?"] = "actions.show_help",
    ["<CR>"] = "actions.select",
    ["<C-v>"] = "actions.select_vsplit",
    ["<C-h>"] = "actions.select_split",
    ["-"] = "actions.parent",
    ["_"] = "actions.open_cwd",
    ["g."] = "actions.toggle_hidden",
  },
})
```

## `plugins\telescope.lua`

```
require('telescope').setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git" },
  },
})
```

## `plugins\treesitter.lua`

```
require('nvim-treesitter.config').setup({
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  
  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
})
```

## `plugins\which-key.lua`

```
require("which-key").setup({
  plugins = {
    spelling = {
      enabled = true,
    },
  },
})
```

## `ctx.py`

````python
from pathlib import Path
from datetime import datetime
import fnmatch
import argparse
import re


# --- Config -------------------------------------------------------------------

LANG_MAP = {
    ".js": "javascript", ".ts": "typescript", ".tsx": "typescriptreact",
    ".jsx": "javascriptreact", ".svelte": "svelte", ".vue": "vue",
    ".html": "html", ".css": "css", ".scss": "scss", ".less": "less",
    ".json": "json", ".yaml": "yaml", ".yml": "yaml", ".toml": "toml",
    ".py": "python", ".rb": "ruby", ".rs": "rust", ".go": "go",
    ".c": "c", ".cpp": "cpp", ".h": "c", ".java": "java",
    ".sh": "bash", ".bash": "bash", ".zsh": "bash",
    ".sql": "sql", ".md": "markdown", ".xml": "xml", ".tf": "hcl",
}


# --- Gitignore ----------------------------------------------------------------

def load_gitignore_patterns(root: Path) -> list[tuple[Path, str]]:
    """Load patterns from all .gitignore files found at root and its parents."""
    patterns: list[tuple[Path, str]] = []

    for directory in [root] + list(root.parents):
        gi = directory / ".gitignore"
        if gi.exists():
            try:
                for line in gi.read_text(encoding="utf-8").splitlines():
                    line = line.strip()
                    if line and not line.startswith("#"):
                        patterns.append((directory, line))
            except OSError:
                pass

    return patterns


def is_ignored(path: Path, root: Path, patterns: list[tuple[Path, str]], output_name: str) -> bool:
    """Check if a path should be excluded from the export."""
    name = path.name

    if name.startswith(".") or name == output_name:
        return True

    for base_dir, pat in patterns:
        try:
            rel = path.relative_to(base_dir)
        except ValueError:
            continue

        rel_str = rel.as_posix()
        parts = rel_str.split("/")

        is_dir_pat = pat.endswith("/")
        clean_pat = pat.rstrip("/")

        for target in [name, rel_str] + parts:
            if fnmatch.fnmatch(target, clean_pat):
                if is_dir_pat and not path.is_dir():
                    continue
                return True

    return False


# --- Tree builder -------------------------------------------------------------

def build_tree(
    root: Path,
    patterns: list[tuple[Path, str]],
    output_name: str,
) -> tuple[list[str], list[Path]]:
    """Walk the directory tree, returning the ASCII tree lines and file list."""
    lines = [f"{root.name}/"]
    files: list[Path] = []

    def _walk(p: Path, prefix: str) -> None:
        try:
            items = sorted(p.iterdir(), key=lambda x: (not x.is_dir(), x.name.lower()))
        except PermissionError:
            return

        items = [x for x in items if not is_ignored(x, root, patterns, output_name)]

        for i, item in enumerate(items):
            is_last = i == len(items) - 1
            connector = "└── " if is_last else "├── "
            lines.append(f"{prefix}{connector}{item.name}{'/' if item.is_dir() else ''}")

            if item.is_dir():
                _walk(item, prefix + ("    " if is_last else "│   "))
            else:
                files.append(item)

    _walk(root, "")
    return lines, files


# --- Markdown rendering -------------------------------------------------------

def make_fence(content: str) -> str:
    """Return the shortest code fence that won't clash with content."""
    max_ticks = max(
        (len(m) for m in re.findall(r"`+", content)),
        default=2,
    )
    return "`" * max(3, max_ticks + 1)


def render_file_section(f: Path, root: Path) -> list[str]:
    """Render a single file as a markdown section."""
    rel = f.relative_to(root)
    print(f"  Reading {rel}...")
    lang = LANG_MAP.get(f.suffix.lower(), "")
    lines = [f"## `{rel}`", ""]

    try:
        raw = f.read_bytes()
        if b"\x00" in raw[:8192]:
            lines += ["> ⚠️ Skipped: binary file", ""]
            return lines
        content = raw.decode("utf-8")
    except UnicodeDecodeError:
        lines += ["> ⚠️ Skipped: non-UTF-8 encoding", ""]
        return lines
    except OSError as e:
        lines += [f"> ⚠️ Error reading file: {e}", ""]
        return lines

    fence = make_fence(content)
    lines += [f"{fence}{lang}", content.rstrip(), fence, ""]
    return lines


# --- Main export --------------------------------------------------------------

def export_tree_to_md(path: str = ".", output_name: str = "project_structure.md", tree_only: bool = False) -> None:
    root = Path(path).resolve()

    if not root.is_dir():
        raise NotADirectoryError(f"Not a directory: {root}")

    patterns = load_gitignore_patterns(root)
    tree_lines, files = build_tree(root, patterns, output_name)

    md: list[str] = [
        "# Project Structure",
        "",
        f"Generated: {datetime.now():%Y-%m-%d %H:%M:%S}",
        "",
        "## Directory Tree",
        "",
        "```",
        *tree_lines,
        "```",
        "",
    ]

    if not tree_only:
        md += [
            "---",
            "",
            "# File Contents",
            "",
        ]
        for f in files:
            md.extend(render_file_section(f, root))

    out = root / output_name
    out.write_text("\n".join(md), encoding="utf-8")

    print(f"✓ Exported to:  {out}")
    print(f"  Files included: {0 if tree_only else len(files)}")


# --- CLI ----------------------------------------------------------------------

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export a project tree + file contents to Markdown.")
    subparsers = parser.add_subparsers(dest="command")

    # Full export (default)
    full_parser = subparsers.add_parser("full", help="Export tree + file contents (default)")
    full_parser.add_argument("path", nargs="?", default=".", help="Root directory (default: current dir)")
    full_parser.add_argument("-o", "--output", default="project_structure.md", help="Output filename")

    # Tree only
    tree_parser = subparsers.add_parser("tree", help="Export directory tree only")
    tree_parser.add_argument("path", nargs="?", default=".", help="Root directory (default: current dir)")
    tree_parser.add_argument("-o", "--output", default="project_structure.md", help="Output filename")

    args = parser.parse_args()

    # Default to full if no subcommand given
    if args.command == "tree":
        export_tree_to_md(args.path, args.output, tree_only=True)
    else:
        path = getattr(args, "path", ".")
        output = getattr(args, "output", "project_structure.md")
        export_tree_to_md(path, output)
````

## `init.lua`

```
-- Ensure pack plugins are loaded (Windows compatible)
local pack_path = vim.fn.stdpath('config') .. '\\pack\\x\\start'
vim.opt.packpath:prepend(vim.fn.stdpath('config'))

-- Add lua paths for Windows
local config_path = vim.fn.stdpath('config')
package.path = package.path .. ';' .. config_path .. '\\?.lua'
package.path = package.path .. ';' .. config_path .. '\\lua\\?.lua'

require('config')
require('keymap')

-- Load plugin configs
require('plugins.treesitter')
require('plugins.lsp')
require('plugins.cmp')
require('plugins.oil')
require('plugins.telescope')
require('plugins.gitsigns')
require('plugins.lualine')
require('plugins.which-key')
require('plugins.autopairs')
```

## `install.sh`

```bash
#!/bin/bash

PACK_DIR="$HOME/AppData/Local/nvim/pack/x/start"
mkdir -p "$PACK_DIR"
cd "$PACK_DIR" || exit

echo "Installing Neovim plugins to $PACK_DIR..."

echo "Cloning nvim-treesitter..."
git clone https://github.com/nvim-treesitter/nvim-treesitter

echo "Cloning nvim-lspconfig..."
git clone https://github.com/neovim/nvim-lspconfig

echo "Cloning mason.nvim..."
git clone https://github.com/williamboman/mason.nvim

echo "Cloning nvim-cmp..."
git clone https://github.com/hrsh7th/nvim-cmp

echo "Cloning cmp-nvim-lsp..."
git clone https://github.com/hrsh7th/cmp-nvim-lsp

echo "Cloning cmp-buffer..."
git clone https://github.com/hrsh7th/cmp-buffer

echo "Cloning oil.nvim..."
git clone https://github.com/stevearc/oil.nvim

echo "Cloning telescope.nvim..."
git clone https://github.com/nvim-telescope/telescope.nvim

echo "Cloning plenary.nvim..."
git clone https://github.com/nvim-lua/plenary.nvim

echo "Cloning onedark.nvim..."
git clone https://github.com/navarasu/onedark.nvim

echo "Cloning gitsigns.nvim..."
git clone https://github.com/lewis6991/gitsigns.nvim

echo "Cloning lualine.nvim..."
git clone https://github.com/nvim-lualine/lualine.nvim

echo "Cloning which-key.nvim..."
git clone https://github.com/folke/which-key.nvim

echo "Cloning nvim-autopairs..."
git clone https://github.com/windwp/nvim-autopairs

echo "Done! All plugins installed."
```
`````
