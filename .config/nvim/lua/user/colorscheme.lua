local colorscheme = "lucid"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- Make the color of the tab line more coherent with the rest of the colorscheme
vim.cmd [[
    :hi TabLineFill gui=none
]]
