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

local fill_buffer = function()
    local line = string.rep("-", width)
    local filler = {}

    for _ = 1, height do
        table.insert(filler, line)
    end
    return filler
end

local get_text_offsets = function()
    return {
        start_row = 5,
        end_row = 5,
        start_col = 5,
        end_col = 5
    }
end

M.show_warning = function()
    local buffer = vim.api.nvim_create_buf(false, true)
    local buffer_content = fill_buffer()
    local message = MESSAGES[random_message_index()]
    local message_offsets = get_text_offsets()
    -- get the key that triggered the warning
    --
    -- get suggestion for alternative keystroke
    --

    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, buffer_content)
    vim.api.nvim_buf_set_text(
        buffer, 
        message_offsets["start_row"],
        message_offsets["start_col"],
        message_offsets["end_row"],
        message_offsets["end_col"],
        {message}
    )
    vim.api.nvim_open_win(buffer, true, opts)
end

M.show_warning()

return M
