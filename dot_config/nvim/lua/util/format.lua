local M = {}

function M.has_client(bufnr, name)
	for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
		if client.name == name then
			return true
		end
	end
	return false
end

function M.format_with(bufnr, client_name, timeout_ms)
	vim.lsp.buf.format({
		bufnr = bufnr,
		timeout_ms = timeout_ms or 2000,
		filter = function(client)
			return client.name == client_name
		end,
	})
end

function M.can_format(bufnr)
	return vim.bo[bufnr].buftype == ""
		and vim.bo[bufnr].modifiable
		and vim.api.nvim_buf_get_name(bufnr) ~= ""
end

return M
