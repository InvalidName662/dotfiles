local h = require("helper")
vim.api.nvim_set_var("mapleader", " ")

--Normal mode
h.map("x", "kj", "<esc>", h.default_ops)
h.map("i", "kj", "<esc>", h.default_ops)
h.map("x", "<esc>", h.nop, h.default_ops)
h.map("i", "<esc>", h.nop, h.default_ops)

-- Navigation
h.nnoremap("<leader>q", ":wqa<CR>")
h.noremap("B", "be")
h.noremap("H", "^")
h.noremap("L", "$")
h.noremap("<A-l>", ":TmuxNavigateRight<CR>")
h.noremap("<A-h>", ":TmuxNavigateLeft<CR>")
h.noremap("<A-j>", ":TmuxNavigateDown<CR>")
h.noremap("<A-k>", ":TmuxNavigateUp<CR>")
h.noremap("<A-,>", ":TmuxNavigatePrevious<CR>")
h.map("n", "<C-p>", "(len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached').\"<CR>\"", { expr = true, noremap = true })

-- Text Manipulation
h.nnoremap("X", "d")
h.nnoremap("XX", "dd")
h.xnoremap("X", "d")
h.nnoremap("+", "~")
h.nnoremap("Q", "@") --@ sucks
h.nnoremap("<leader>ta", "<cmd>ToggleAlternate<CR>")

--LSP
h.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
h.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
h.nnoremap("gu", "<cmd>lua vim.lsp.buf.incoming_calls()<CR>")
h.nnoremap("<C-Space>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
h.nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
h.nnoremap("<C-f>", "<cmd>lua vim.lsp.buf.formatting()<CR>")

h.nnoremap("<leader>gs", "<cmd>Gitsigns toggle_linehl<CR>")
h.nnoremap("<leader>u", "<cmd>UrlView<CR>")

-- Buffers
h.nnoremap("<leader>l", ":bn<CR>")
h.nnoremap("<leader>h", ":bp<CR>")
h.nnoremap("<leader>c", ":cclose<CR>")

-- Quick saving
h.nnoremap("<leader>w", ":wa<CR>")

-- Spelling
h.nnoremap("<leader>s", ":set spell!<CR>")

-- Stop using the f*cking arrow keys pleeeease
h.noremap(h.up, h.nop)
h.noremap(h.down, h.nop)
h.noremap(h.right, h.nop)
h.noremap(h.left, h.nop)
h.inoremap(h.up, h.nop)
h.inoremap(h.down, h.nop)
h.inoremap(h.right, h.nop)
h.inoremap(h.left, h.nop)

h.nnoremap("ü", "{")
h.vnoremap("ü", "{")
h.nnoremap("ä", "}")
h.vnoremap("ä", "}")

