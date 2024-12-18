return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8'
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "hrsh7th/nvim-cmp"
  },
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "williamboman/mason-lspconfig.nvim" 
  },
  {
    "neovim/nvim-lspconfig" 
  },
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },
  {
    'numToStr/Comment.nvim',
  },
  {
    'Glench/Vim-Jinja2-Syntax',
  },
}
