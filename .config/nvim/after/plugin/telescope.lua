local telescope_actions = require("telescope.actions")
local telescope = require("telescope")
telescope.setup({
	defaults = {
		-- Add this to your mappings
		mappings = {
			i = {
				-- Replace <c-d> with your desired keybinding
				["<c-d>"] = telescope_actions.delete_buffer,
			},
			n = {
				["<c-d>"] = telescope_actions.delete_buffer,
			},
		},
	},
})
