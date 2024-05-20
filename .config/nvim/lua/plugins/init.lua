return {
  {"christoomey/vim-tmux-navigator",lazy = false},
  {"mfussenegger/nvim-jdtls"},
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clangd","clang-format",
        "typescript-language-server",
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "google-java-format",
        "jdtls",
      }
    }
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {"jose-elias-alvarez/null-ls.nvim",
    -- dependencies = {
    --   "gbprod/none-ls-shellcheck.nvim", -- shellcheck
    --   "nvimtools/none-ls-extras.nvim", -- eslint_d
    -- },
    event = "VeryLazy",
    opts = function()
      return require "configs.null-ls"
    end
  },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
