vim.cmd([[command! NaughtyBoy :lua require"bad-habits".show_warning()]])

-- Arrow keys
-- TODO: Pass Key as arg to NaughtyBoy cmd to use in warninig message.
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>NaughtyBoy<cr>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>NaughtyBoy<cr>", {})
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>NaughtyBoy<cr>", {})
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>NaughtyBoy<cr>", {})
