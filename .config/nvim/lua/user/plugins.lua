local fn = vim.fn

-- Install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer - close and reopen nvim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that automatically reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on the first time
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("Packer failed to load")
    return
end

-- Have packer in a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install plugins here
return packer.startup(function(use)
    -- General
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the popup API from vim into neovim
    use "nvim-lua/plenary.nvim" -- Useful functions use by lots of plugins
    use "windwp/nvim-autopairs" -- Autopairs parenthesis, brackets, braces to automatically close them
    use "kyazdani42/nvim-web-devicons" -- Fancy icons
    use "kyazdani42/nvim-tree.lua" -- Tree file explorer
    use "akinsho/bufferline.nvim" -- Line to display buffers (fancy tabs)
    use "moll/vim-bbye" -- Adds commands to manage buffers
    use "akinsho/toggleterm.nvim" -- Adds terminal to nvim


    -- Colorschemes
    use "cseelus/vim-colors-lucid" -- Lucid colorscheme

    -- Cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- Buffer completions
    use "hrsh7th/cmp-path" -- Path completions
    use "hrsh7th/cmp-cmdline" -- Cmdline completions
    use "hrsh7th/cmp-nvim-lsp" -- LSP completions
    use "hrsh7th/cmp-nvim-lua" -- Lua completions
    use "saadparwaiz1/cmp_luasnip" -- Snippet completions

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet engine
    use "rafamadriz/friendly-snippets" -- A bunch of preconfiged snippets

    -- LSP
    use "neovim/nvim-lspconfig" -- Enable LSP
    use "williamboman/nvim-lsp-installer" -- Language server installer

    -- Keybinds
    use "tpope/vim-commentary"
    use "tpope/vim-surround"

    -- Telescope
    use "nvim-telescope/telescope.nvim" -- Fzf finder
    use "nvim-telescope/telescope-media-files.nvim" -- Adds support for telescope to preview media files

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"

    -- Lualine
    use "nvim-lualine/lualine.nvim"

    -- EWW
    use "elkowar/yuck.vim"
    use "gpanders/nvim-parinfer"

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
