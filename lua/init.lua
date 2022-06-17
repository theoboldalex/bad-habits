local M = {}

local width = 50
local height = 10
local window_width = (vim.api.nvim_win_get_width(0) / 2) - (width / 2)
local window_height = (vim.api.nvim_win_get_height(0) / 2) - (height / 2)
local opts = {
    style = "minimal",
    width = width,
    height = height,
    relative = "win",
    row = window_height,
    col = window_width,
}

M.show_warning = function()
    local buffer = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_open_win(buffer, true, opts)
end

return M
