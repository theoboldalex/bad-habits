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
    local line = string.rep(" ", width)
    local filler = {}

    for _ = 1, height do
        table.insert(filler, line)
    end
    return filler
end

local write_messgage = function(buffer, lines)
    local offset = 0
    for _, line in ipairs(lines) do
        local start_col = math.floor((width - #line) / 2)
        local end_col = math.floor(start_col + #line)
        local current_row = math.floor(height / 2 - #lines / 2 + offset)
        offset = offset + 1
        vim.api.nvim_buf_set_text(buffer, current_row, start_col, current_row, end_col, {line})
    end
end

local remap_bad_habit_keys = function()
    vim.api.nvim_set_keymap("n", "<Up>", "<cmd>NaughtyBoy Up<Space>Arrow<cr>", {})
    vim.api.nvim_set_keymap("n", "<Down>", "<cmd>NaughtyBoy Down<Space>Arrow<cr>", {})
    vim.api.nvim_set_keymap("n", "<Left>", "<cmd>NaughtyBoy Left<Space>Arrow<cr>", {})
    vim.api.nvim_set_keymap("n", "<Right>", "<cmd>NaughtyBoy Right<Space>Arrow<cr>", {})
end

local map_window_close_keys = function(buffer)
    local bufClosingKeys = {"<Esc>", "<CR>", "<Leader>"}

    for _, key in ipairs(bufClosingKeys) do
        vim.api.nvim_buf_set_keymap(
            buffer,
            "n",
            key,
            ":close<CR>",
            {
                silent=true,
                nowait=true,
                noremap=true
            }
        )
    end

    remap_bad_habit_keys()
end

local unmap_bad_habit_keys = function(buffer)
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Up>", "<Up>", {})
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Down>", "<Down>", {})
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Left>", "<Left>", {})
    vim.api.nvim_buf_set_keymap(buffer, "n", "<Right>", "<Right>", {})
end

M.show_warning = function(key)
    local buffer = vim.api.nvim_create_buf(false, true)
    local buffer_content = fill_buffer()
    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, buffer_content)
    map_window_close_keys(buffer)

    local reason = string.format("Looks like you pressed the %s key.", key)
    local message = MESSAGES[random_message_index()]

    write_messgage(buffer, {message, reason})
    vim.api.nvim_open_win(buffer, true, opts)
    unmap_bad_habit_keys(buffer)
end

return M
