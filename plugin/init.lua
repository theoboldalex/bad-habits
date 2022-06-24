vim.cmd([[command! -nargs=1 NaughtyBoy :lua require"bad-habits".show_warning(<f-args>)]])

-- Arrow keys
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>NaughtyBoy Up<Space>Arrow<cr>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>NaughtyBoy Down<Space>Arrow<cr>", {})
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>NaughtyBoy Left<Space>Arrow<cr>", {})
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>NaughtyBoy Right<Space>Arrow<cr>", {})
