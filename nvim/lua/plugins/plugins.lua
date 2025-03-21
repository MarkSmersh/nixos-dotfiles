return {
	{
		"navarasu/onedark.nvim",
		-- name = "catppuccin",
		priority = 1000,
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		config = function()
			require("nvim-tree").setup({})
		end,
	},
	{
		"williamboman/mason.nvim",
	},
	{
		"hrsh7th/nvim-cmp",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"williamboman/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"m4xshen/autoclose.nvim",
	},
	{
		"windwp/nvim-ts-autotag",
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
    {
        "nvim-tree/nvim-web-devicons"
    }
}
