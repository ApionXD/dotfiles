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
vim.g.coq_settings = { auto_start = 'shut-up' }
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- add your plugins here
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "ms-jpq/coq_nvim",
        "nvim-tree/nvim-tree.lua",
        "ms-jpq/coq.thirdparty",
        "ms-jpq/coq.artifacts",
        "folke/tokyonight.nvim",
        "nvim-tree/nvim-web-devicons",
        "ibhagwan/fzf-lua"
    }
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "tokyonight" } },
  -- automatically check for plugin updates
  checker = { enabled = true }
})
require("nvim-tree").setup()
require("coq_3p") {
    { src="nvimlua" },
    { src="repl" }
}
require("mason").setup()
require("mason-lspconfig").setup()
local lspconfig = require("lspconfig")
local coq = require("coq")
lspconfig.kotlin_language_server.setup(coq.lsp_ensure_capabilities())
lspconfig.bashls.setup(coq.lsp_ensure_capabilities())
lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities())
vim.cmd("colorscheme tokyonight")
