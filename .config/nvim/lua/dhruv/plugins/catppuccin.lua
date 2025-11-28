return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			-- 	styles = {
			-- 		keywords = { "bold" },
			-- 	},
			-- 	-- transparent_background = true,})
			flavour = "mocha",
			transparent_background = true,
			-- 	auto_integrations = true,
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
