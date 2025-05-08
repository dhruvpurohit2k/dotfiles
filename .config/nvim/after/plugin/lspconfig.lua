require("mason").opt = {
	ensure_installed = servers,
}
-- require("mason-tool-installer").setup({
-- 	ensure_installed = servers,
-- })
require("mason-lspconfig").setup({
	-- ensure_installed = servers,
})

local on_attach = function(_, _)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]ename token" })
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
end

local lspconfig = require("lspconfig")
local capabilities = require("blink.cmp").get_lsp_capabilities()
capabilities.offsetEncoding = { "utf-16" }
lspconfig.pyright.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.lua_ls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.clangd.setup({
	on_attach = function(client, bufnr)
		client.server_capabilities.signaturehelpprovider = false
		on_attach(client, bufnr)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]ename token" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })
	end,
	capabilities = capabilities,
})
lspconfig.ts_ls.setup({ capabilities = capabilities, on_attach = on_attach })
lspconfig.jdtls.setup({ capabilities = capabilities, on_attach = on_attach })
