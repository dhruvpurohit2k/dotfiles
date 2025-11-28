return {
	"vhyrro/luarocks.nvim",
	priority = 1000, -- High priority to ensure it runs early
	opts = {
		rocks = {
			"fzy", -- Example rock to install
			"pathlib.nvim ~> 1.0", -- Another example with version constraint
		},
		-- luarocks_build_args = { "--with-lua=/my/path" }, -- Optional: extra args for LuaRocks build
	},
}
