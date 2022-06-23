vim.cmd([[command! -nargs=1 NaughtyBoy :lua require"bad-habits".show_warning(<f-args>)]])

-- Arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>NaughtyBoy up<cr>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>NaughtyBoy down<cr>", {})
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>NaughtyBoy left<cr>", {})
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>NaughtyBoy right<cr>", {})
