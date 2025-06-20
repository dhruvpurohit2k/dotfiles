return {
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring.git",
	config = function()
		require("ts_context_commentstring").setup({
			enable_autocmd = false,
		})
	end,
}
