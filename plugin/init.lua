vim.cmd([[command! -nargs=1 NaughtyBoy :lua require"bad-habits".show_warning(<f-args>)]])

-- Arrow keys
-- TODO: Pass Key as arg to NaughtyBoy cmd to use in warninig message.
-- Something along the lines of...
-- vimi.api.nvim_set_keymap("n", "<Up>", "<cmd>NaughtyBoy <Up><cr>", {})
vim.api.nvim_set_keymap("n", "<Up>", "<cmd>NaughtyBoy up<cr>", {})
vim.api.nvim_set_keymap("n", "<Down>", "<cmd>NaughtyBoy down<cr>", {})
vim.api.nvim_set_keymap("n", "<Left>", "<cmd>NaughtyBoy left<cr>", {})
vim.api.nvim_set_keymap("n", "<Right>", "<cmd>NaughtyBoy right<cr>", {})
