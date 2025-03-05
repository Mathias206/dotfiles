vim.o.number = true
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.guicursor = "n-v-c:block,i:block"
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"
vim.o.mouse = "a"
vim.opt.scrolloff = 10
vim.cmd("colorscheme ocean")

-- Telescope Keymaps
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>")

-- General Keymaps
vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<CR>", { noremap = true, silent = true })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"nvim-treesitter/nvim-treesitter", -- Syntax highlighting
	"nvim-lua/plenary.nvim", -- Lua functions (dependency)
	"nvim-telescope/telescope.nvim", -- Fuzzy finder
	"neovim/nvim-lspconfig", -- LSP support
	"williamboman/mason.nvim", -- Package manager
	"williamboman/mason-lspconfig.nvim", -- Bridge between Mason & LSP
	"windwp/nvim-autopairs",
	"stevearc/conform.nvim",
	"mfussenegger/nvim-lint",
	"WhoIsSethDaniel/mason-tool-installer.nvim",
})

-- autopairs
require("nvim-autopairs").setup({
	check_ts = true,
})

-- LSP specific keymaps
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "<leader>fd", function()
		vim.lsp.buf.format()
	end, opts)
end

-- call language lint when exit insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	callback = function()
		require("lint").try_lint()
	end,
})

-- disable LSP syntax highlighting to avoid conflict with treesitter
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.server_capabilities.semanticTokensProvider then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "python", "javascript", "go", "gomod", "gowork", "java", "typescript" },
	highlight = { enable = true },
})

-- load Mason
require("mason").setup()

-- install lsp's
require("mason-lspconfig").setup({
	ensure_installed = { "pyright", "lua_ls", "jdtls", "gopls", "golangci_lint_ls" },
	automatic_installation = true,
})

-- install formatters and linters
require("mason-tool-installer").setup({
	ensure_installed = { "stylua", "ruff", "golangci-lint" },
})

-- set formatters
require("conform").setup({
	formatters_by_ft = {
		python = { "black", "isort" },
		go = { "gofmt", "goimports" },
		lua = { "stylua" },
	},
	format_on_save = {
		timeout = 300,
		lsp_format = "fallback",
	},
})

-- define linters
require("lint").linters_by_ft = {
	python = { "ruff" },
	go = { "golangcilint" },
}

-- general lsp config
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
	function(server_name)
		local opts = {}
		if server_name == "lua_ls" then
			opts = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
				on_attach = on_attach,
			}
		end
		lspconfig[server_name].setup(opts)
	end,
})