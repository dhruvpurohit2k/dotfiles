require("mason").opt = {}
require("mason-lspconfig").setup({})

local on_attach = function(_, bufnr)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]ename token" })
	local buf_set_keymap = vim.api.nvim_buf_set_keymap
	-- local opts = { noremap = true, silent = true }
	local opts = {}
	buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
end
-- local lspconfig = require("lspconfig")
-- local lspconfig = vim.lsp.config()
local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.offsetEncoding = "utf-16"
vim.lsp.config("*", {
	capabilities = capabilities,
	on_attach = on_attach,
})
vim.lsp.config("clangd", {
	on_attach = function(client, bufnr)
		local buf_set_keymap = vim.api.nvim_buf_set_keymap
		local opts = { noremap = true, silent = true }

		buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

		client.server_capabilities.signaturehelpprovider = false
		on_attach(client, bufnr)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]ename token" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
	end,
	capabilities = capabilities,
})
vim.lsp.config("jdtls", {
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }),
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true", -- Useful for debugging
		"-Dlog.level=ALL",   -- Useful for debugging
		"-Xmx1G",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
		"-configuration",
		vim.fn.stdpath("data") .. "/mason/packages/jdtls/config_linux", -- or config_mac/config_win
		"-data",
		vim.fn.stdpath("data") .. "/jdtls-workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
	},
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		-- Keymaps for LSP functions
		local buf_set_keymap = vim.api.nvim_buf_set_keymap
		local opts = { noremap = true, silent = true }

		buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	end,
})
vim.api.nvim_create_autocmd("BufReadCmd", {
	pattern = "jdt://*",
	callback = function(args)
		require("jdtls").open_classfile(args.match)
	end,
})
vim.lsp.enable("lua_ls", true)
vim.lsp.enable("ts_ls", true)
vim.lsp.enable("gopls", true)
