-- Moving around in vim
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--Diagnostic KeyMaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
--Open NETRW
vim.keymap.set("n", "<leader>nw", vim.cmd.Ex, { desc = "Open netrw" })

--Taken from the Primeagen
vim.keymap.set("n", "J", "mzJ`z", { desc = "Appends the line below to the current line" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Page [D]own" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Page [U]p" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Better next" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Better previous" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("i", "{", "{}<Left>", {
	noremap = true, -- Non-recursive mapping
	silent = true, -- Optional: Don't show the command in the command line
	desc = "Auto-pair curly braces", -- Optional: Description for keymap listing
})

vim.keymap.set("i", "(", "()<Left>", {
	noremap = true, -- Non-recursive mapping
	silent = true, -- Optional: Don't show the command in the command line
	desc = "Auto-pair parentheses", -- Optional: Description for keymap listing
})
vim.keymap.set("i", "}", function()
	local line = vim.api.nvim_get_current_line()
	local _, col = unpack(vim.api.nvim_win_get_cursor(0)) -- 0-based column index
	-- Get character one byte position after the cursor
	local next_char = vim.fn.strcharpart(line, col, 1)
	if next_char == "}" then
		-- If the next character is already '}', move cursor right
		-- return vim.api.nvim_replace_termcodes("<Right>", true, false, true)
		return "<Right>"
	else
		-- Otherwise, insert the '}' character normally
		return "}"
	end
end, {
	expr = true, -- Evaluate the function to determine the mapping result
	noremap = true,
	desc = "Overtype or insert }",
})
-- Handle ')' closing bracket
vim.keymap.set("i", ")", function()
	local line = vim.api.nvim_get_current_line()
	local _, col = unpack(vim.api.nvim_win_get_cursor(0))
	local next_char = vim.fn.strcharpart(line, col + 1, 1)

	if next_char == ")" then
		-- If the next character is already ')', move cursor right
		return "<Right>"
	else
		-- Otherwise, insert the ')' character normally
		return ")"
	end
end, {
	expr = true, -- Evaluate the function to determine the mapping result
	noremap = true,
	desc = "Overtype or insert )",
})
