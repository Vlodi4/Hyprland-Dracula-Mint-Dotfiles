--vim.keymap.set("n", "<leader>e", "<Cmd>Explore<CR>")

local fzf = require("fzf-lua")

vim.keymap.set("n", "<leader><leader>", fzf.files)
vim.keymap.set("n", "<leader>/", fzf.live_grep)


local opts = { noremap = true, silent = true }

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<Leader>f", ":lua vim.lsp.buf.format()<CR>", opts)

vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end)

vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

vim.keymap.set("n", "<leader>x", ":bdelete<CR>", { desc = "Закрыть вкладку" })

vim.keymap.set("n", "<leader>p", "<Cmd>BufferLinePick<CR>")
