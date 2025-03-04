vim.o.number = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.termguicolors = true
vim.o.guicursor = "n-v-c:block,i:block"
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.cmd("colorscheme ocean")



-- Telescope Keymaps

vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")

-- General Keymaps

vim.api.nvim_set_keymap('n', '<S-Tab>', ":bprevious<CR>", { noremap = true, silent = true })


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    "nvim-treesitter/nvim-treesitter",  -- Syntax highlighting
    "nvim-lua/plenary.nvim",            -- Lua functions (dependency)
    "nvim-telescope/telescope.nvim",    -- Fuzzy finder
    "neovim/nvim-lspconfig",            -- LSP support
    "williamboman/mason.nvim",          -- Package manager
    "williamboman/mason-lspconfig.nvim" -- Bridge between Mason & LSP
})


local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
end

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        vim.lsp.buf.format()
    end,
})

require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "python", "javascript", "go", "java" },
    highlight = { enable = true },
})

-- Load Mason
require("mason").setup()

-- Load Mason-LSPConfig
require("mason-lspconfig").setup(
    {
        ensure_installed = { "pyright", "lua_ls" },
        automatic_installation = true,
    }
)
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers(
    {
        function(server_name)
            lspconfig[server_name].setup({
                on_attach = on_attach,
            })
        end,
    }
)
