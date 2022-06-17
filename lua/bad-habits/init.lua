require "../messages"

local M = {}

local width = 75
local height = 15
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

local random_message_index = function()
    math.randomseed(os.time())
    return math.random(#MESSAGES)
end

M.show_warning = function()
    local buffer = vim.api.nvim_create_buf(false, true)
    local message = MESSAGES[random_message_index()]

    -- get the key that triggered the warning
    --
    -- get suggestion for alternative keystroke
    --

    vim.api.nvim_buf_set_lines(buffer, 0, 0, false, {message})
    vim.api.nvim_open_win(buffer, true, opts)
end

M.show_warning()

return M