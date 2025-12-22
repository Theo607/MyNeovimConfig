# MyNeovimConfig

A modern Neovim configuration focused on productivity, LSP, Git, debugging, and coding enhancements.

---

## Features

- **LSP & Autocompletion**:
  - `nvim-lspconfig`, `mason.nvim` for LSP servers
  - `nvim-cmp` with `LuaSnip` snippets
  - Formatting with `null-ls`

- **Git Integration**:
  - `gitsigns.nvim` for inline Git info, blame, hunk staging/resetting

- **Debugging**:
  - `nvim-dap` with UI, virtual text, and REPL
  - Keymaps for breakpoints, step in/out/over

- **Navigation**:
  - `telescope.nvim` for fuzzy finding files, buffers, live grep
  - `harpoon` for quick file navigation
  - `oil.nvim` for directory/file management

- **Editing Enhancements**:
  - `nvim-surround` for surrounding text objects
  - `nvim-autopairs` for brackets, quotes, and tags
  - `Comment.nvim` for easy commenting
  - `vim-repeat` to repeat plugin actions

- **UI/UX**:
  - `alpha-nvim` for dashboard
  - `lualine.nvim` for statusline
  - `twilight.nvim` for focusing on current code
  - `noice.nvim` for improved UI messages
  - `fidget.nvim` to show LSP progress
  - `vim-illuminate` to highlight word under cursor

---

## Keymap Cheatsheet

### General
- `<leader>?` → Show cheatsheet  
- `<leader>d` → Open Dashboard  
- `jk / kj` → Exit insert mode  
- `<leader>n` → Toggle line numbers  

### Windows & Buffers
- `<leader>sv` → Vertical split  
- `<leader>sh` → Horizontal split  
- `<leader>se` → Equalize splits  
- `<leader>sx` → Close split  
- `<C-h>` → Move to left split  
- `<C-j>` → Move to below split  
- `<C-k>` → Move to above split  
- `<C-l>` → Move to right split  
- `<S-l>` → Next buffer  
- `<S-h>` → Previous buffer  
- `<leader>bd` → Delete buffer  

### LSP
- `gd` → Go to definition  
- `grr` → References  
- `K` → Hover  
- `<leader>rn` → Rename symbol  
- `<leader>ca` → Code action  
- `<leader>f` → Format buffer  

### Harpoon
- `<leader>a` → Add file  
- `<leader>m` → Harpoon menu  
- `<leader>1-9` → Jump to file  

### Debugging
- `<F5>` → Start/Continue  
- `<F10>` → Step Over  
- `<F11>` → Step Into  
- `<F12>` → Step Out  
- `b` → Toggle breakpoint  
- `B` → Conditional breakpoint  

### Git
- `hp` → Preview hunk  
- `hs` → Stage hunk  
- `hr` → Reset hunk  
- `hu` → Undo stage hunk  
- `hR` → Reset buffer  
- `hS` → Stage buffer  
- `hd` → Git diff current file  
- `hD` → Git diff previous commit  
- `tb` → Toggle blame  
- `hb` → Blame line  

### Copilot
- `<C-L>` → Accept suggestion  
- `co` → Enable Copilot  
- `cd` → Disable Copilot  

### Snippets
- `da` → Enable LuaSnip snippets  
- `ds` → Disable LuaSnip snippets  

### Search
- `<leader>ff` → Find files  
- `<leader>fg` → Live grep  
- `<leader>fb` → Buffers  
- `<leader>fh` → Help tags  

