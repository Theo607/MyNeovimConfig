-- lua/core/cheatsheet.lua
local M = {}
M.current_buf = nil -- track the currently open buffer

-- Sections of keymaps
local sections = {
    General = {
        { "<leader>?", "Show cheatsheet" },
        { "<leader>d", "Open Dashboard" },
        { "jk / kj",   "Exit insert mode" },
        { "<leader>n", "Toggle relative/absolute line numbers" },
        { "< / >",     "Indent in visual mode" },
        { "<A-j>",     "Move selected text down" },
        { "<A-k>",     "Move selected text up" },
        { "<leader>z", "Toggle Twilight (focus mode)" },
    },

    Windows_Buffers = {
        { "<leader>sv", "Vertical split" },
        { "<leader>sh", "Horizontal split" },
        { "<leader>se", "Equalize splits" },
        { "<leader>sx", "Close split" },
        { "<C-h>",      "Move to left split" },
        { "<C-j>",      "Move to below split" },
        { "<C-k>",      "Move to above split" },
        { "<C-l>",      "Move to right split" },
        { "<S-l>",      "Next buffer" },
        { "<S-h>",      "Previous buffer" },
        { "<leader>bd", "Delete buffer" },
    },
    LSP = {
        { "gd",         "Go to definition" },
        { "grr",        "References" },
        { "K",          "Hover" },
        { "<leader>rn", "Rename symbol" },
        { "<leader>ca", "Code action" },
        { "<leader>f",  "Format buffer" },
    },
    Harpoon = {
        { "<leader>a", "Add file to Harpoon" },
        { "<leader>m", "Harpoon menu" },
        { "1–9", "Jump to Harpoon file" },
    },
    Debugging = {
        { "<F5>",  "Debug: Start/Continue" },
        { "<F10>", "Debug: Step Over" },
        { "<F11>", "Debug: Step Into" },
        { "<F12>", "Debug: Step Out" },
        { "b",     "Toggle breakpoint" },
        { "B",     "Conditional breakpoint" },
        { "dr",    "Open DAP REPL" },
        { "du",    "Toggle DAP UI" },
        { "dj",    "Stack down" },
        { "dk",    "Stack up" },
    },
    Git = {
        { "hp", "Preview hunk" },
        { "hs", "Stage hunk" },
        { "hr", "Reset hunk" },
        { "hu", "Undo stage hunk" },
        { "hR", "Reset buffer" },
        { "hS", "Stage buffer" },
        { "hd", "Git diff current file" },
        { "hD", "Git diff against previous commit" },
        { "tb", "Toggle blame" },
        { "hb", "Blame line" },
    },
    Copilot = {
        { "<C-L>", "Accept Copilot suggestion" },
        { "co",    "Enable Copilot" },
        { "cd",    "Disable Copilot" },
    },
    Snippets = {
        { "da", "Enable LuaSnip snippets" },
        { "ds", "Disable LuaSnip snippets" },
    },
    Surround = {
        { "ys{motion}{char}", "Add surround" },
        { "cs{from}{to}",     "Change surround" },
        { "ds{char}",         "Delete surround" },
        { "yss{char}",        "Surround current line" },
        { "<C-g>s",           "Insert mode add surround" },
        { "<C-g>S",           "Insert mode add surround to line" },
    },
    Search = {
        { "<leader>ff", "Find files" },
        { "<leader>fg", "Live grep" },
        { "<leader>ft", "Find all TODOs (Telescope)" },
        { "<leader>fb", "Buffers" },
        { "<leader>fh", "Help tags" },
    },
    Comments = { -- new section
        { "gcc",               "Toggle line comment [n]" },
        { "gbc",               "Toggle block comment [n]" },
        { "gc{motion}",        "Comment motion [n]" },
        { "gb{motion}",        "Comment block motion [n]" },
        { "gc / gb in visual", "Toggle comment on selection [v]" },
    },
    Vim_Repeat = {
        { ".", "Repeat last change / plugin operator (surround, comment, etc.)" },
    },
    TODO = {
        { "]t", "Next TODO comment" },
        { "[t", "Previous TODO comment" },
    },

    Oil = {
        { "<leader>o", "Open Oil file manager" },
        { "<CR>",      "Open file/folder" },
        { "<C-v>",     "Open in vertical split" },
        { "<C-s>",     "Open in horizontal split" },
        { "<C-t>",     "Open in new tab" },
        { "-",         "Go up one directory" },
        { "r",         "Refresh directory" },
        { "a",         "Create file/folder" },
        { "d",         "Delete file/folder" },
        { "R",         "Rename file/folder" },
        { "y",         "Copy file/folder" },
        { "p",         "Paste copied file/folder" },
        { "q",         "Close Oil buffer" },
    },
}

-- Helper: wipe buffer if it exists
local function wipe_buf()
    if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
        vim.api.nvim_buf_delete(M.buf, { force = true })
        M.buf = nil
    end
end

local function close_buf()
    if M.buf and vim.api.nvim_buf_is_valid(M.buf) then
        -- Close the window showing this buffer first
        for _, win in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(win) == M.buf then
                vim.api.nvim_win_close(win, true) -- true = force close
            end
        end
        M.buf = nil
    end
end

-- Show section in the cheatsheet buffer
local function show_section(name)
    wipe_buf() -- wipe previous buffer to avoid leftovers
    vim.cmd("vnew")
    M.buf = vim.api.nvim_get_current_buf()
    vim.bo[M.buf].buftype = "nofile"
    vim.bo[M.buf].bufhidden = "wipe"
    vim.bo[M.buf].swapfile = false
    vim.cmd("vertical resize 55")
    vim.cmd("setlocal nowrap")
    vim.bo[M.buf].modifiable = true

    local lines = { "=== " .. name .. " ===", "" }
    for _, km in ipairs(sections[name]) do
        table.insert(lines, string.format("%-20s → %s", km[1], km[2]))
    end
    table.insert(lines, "")
    table.insert(lines, "<Esc> to go back / q to close")

    vim.api.nvim_buf_set_lines(M.buf, 0, -1, false, lines)
    vim.bo[M.buf].modifiable = false
    vim.api.nvim_set_current_buf(M.buf)

    -- Close section and go back to main menu
    vim.keymap.set("n", "<Esc>", function()
        close_buf()
        show_main_menu()
    end, { buffer = M.buf, silent = true })

    -- Close buffer entirely
    vim.keymap.set("n", "q", function()
        close_buf()
    end, { buffer = M.buf, silent = true })
end

-- Show main menu
function show_main_menu()
    wipe_buf() -- ensure old buffer is closed
    local choices = {}
    for sec, _ in pairs(sections) do table.insert(choices, sec) end
    table.sort(choices)

    vim.ui.select(choices, { prompt = "Select cheatsheet section:" }, function(choice)
        if choice then
            show_section(choice)
        end
    end)
end

M.show = show_main_menu

-- Keymap to open cheatsheet
vim.keymap.set("n", "<leader>?", M.show, { desc = "Show keymap cheatsheet" })

return M
