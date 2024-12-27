vim.filetype.add({
	extension = {
		njk = "njk",
	},
})

-- Loading lazy package

require("config.lazy")

local builtin = require("telescope.builtin")
local cmp = require("cmp")
local conform = require("conform")
local lsp = require("lspconfig")
local comment = require("Comment")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local onedark = require("onedark")
local autotag = require("nvim-ts-autotag")
local luasnip = require("luasnip")
local treesitter = require("nvim-treesitter.configs")
local lualine = require("lualine")

-- I just use mason for searching lsps, but
-- installing them via nixpkgs
-- ... in most cases

require("mason").setup()
require("autoclose").setup()

capabilities.textDocument.completion.completionItem.snippetSupport = true

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<Tab>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
		["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
	}, {
		{ name = "buffer" },
	}),
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..

lsp.svelte.setup({
	capabilities = capabilities,
})

lsp.lua_ls.setup({
	capabilities = capabilities,
})

lsp.jinja_lsp.setup({
	capabilities = capabilities,
})

lsp.ts_ls.setup({
	capabilities = capabilities,
})

lsp.gopls.setup({
	capabilities = capabilities,
})

treesitter.setup({
	-- A list of parser names, or "all" (the listed parsers MUST always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
	auto_install = true,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})

onedark.setup({
	style = "deep",
})
onedark.load()

comment.setup({
	padding = true,
	sticky = true,
	ignore = nil,
	toggler = {
		line = "gcc",
		block = "gbc",
	},
	opleader = {
		line = "gc",
		block = "gb",
	},
	extra = {
		above = "gcO",
		below = "gco",
		eol = "gcA",
	},
	mappings = {
		basic = true,
		extra = true,
	},
	pre_hook = nil,
	post_hook = nil,
})

conform.setup({
	formatters_by_ft = {
		javascript = { "ast-grep" },
		typescript = { "ast-grep" },
		html = { "ast-grep" },
		css = { "ast-grep" },
		lua = { "ast-grep", "stylua" },
		njk = { "djlint" },
		nunjucks = { "djlint" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

autotag.setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = true, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
})

lualine.setup({
	options = {
		theme = "onedark",
	},
})

vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

vim.api.nvim_create_user_command("F", function(args)
	local range = nil
	if args.count ~= -1 then
		local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
		range = {
			start = { args.line1, 0 },
			["end"] = { args.line2, end_line:len() },
		}
	end
	conform.format({ async = true, lsp_format = "fallback", range = range })
end, { range = true })

local set = vim.opt -- set options

set.tabstop = 4
set.expandtab = true
set.softtabstop = 4
set.shiftwidth = 4

set.scrolloff = 3

set.cmdheight = 0
