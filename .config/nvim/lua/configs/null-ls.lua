local augroup = vim.api.nvim_create_augroup("LspFormatting",{})
local null_ls = require("null-ls")
local opts = {
  sources = {
    null_ls.builtins.formatting.google_java_format,
    null_ls.builtins.formatting.clang_format,
    null_ls.builtins.formatting.ktlint,
  },
  on_attach = function (client,bufnr)
    if client.supports_method("textdocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("bufwritepre",{
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({bufnr = bufnr})
        end
      })
    end
  end

}

return opts
