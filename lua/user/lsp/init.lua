local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end
require("lspconfig").solargraph.setup({})
require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
