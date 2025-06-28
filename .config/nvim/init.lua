-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.foldlevel = 99
-- Setup lazy.nvim
require("lazy").setup({
    rocks = {
        enabled = false
    },
    spec = {
        -- add your plugins here
        {
            {
                "saghen/blink.cmp",
                version = "1.*",
                opts = {
                    keymap = {
                        preset = 'enter'
                    },
                    completion = {
                        documentation = {
                            auto_show = false
                        }
                    }
                }
            },
            {
                "folke/trouble.nvim",
                opts = {},
                cmd = "Trouble"
            },
            {
                "williamboman/mason.nvim",
                opts = {}
            },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {},
                dependencies = {
                    { "mason-org/mason.nvim", opts = {} },
                    "neovim/nvim-lspconfig",
                },
            },
            { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
            "mfussenegger/nvim-dap",
            "neovim/nvim-lspconfig",
            "nvim-tree/nvim-tree.lua",
            "folke/tokyonight.nvim",
            "nvim-tree/nvim-web-devicons",
            "ibhagwan/fzf-lua",
            "kevinhwang91/nvim-ufo",
            "kevinhwang91/promise-async"
        }
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "tokyonight" } },
    -- automatically check for plugin updates
    checker = { enabled = true }
})

require("nvim-tree").setup()
require('ufo').setup()
require('dapui').setup()

local capabilities = {
    textDocument = {
        foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }
    }
}
capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)
vim.lsp.config('*', {
    capabilities = capabilities
})

vim.cmd("colorscheme tokyonight")
