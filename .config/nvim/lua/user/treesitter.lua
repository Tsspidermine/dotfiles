local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup {
    ensure_installed = { "lua", "python", "rust", "fish", "bash" }, -- of of "all", "maintained" (parsers with maintainers), or a list of languages
    sync_install = false, -- install languages synchronously (only applied to 'ensure_installed')
    ignore_install = { "" }, -- list of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extention
        disable = { "" }, -- list of languages that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = false, disable = { "yaml", "python" } },
    rainbow = {
        enable = true,
        -- disable = { "" } -- list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags
        max_file_lines = nil,
    }
}

