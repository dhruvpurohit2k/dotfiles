--This keymap helps to move around the selected lines 
vim.keymap.set("v","J",":m '>+1<CR>gv=gv")
vim.keymap.set("v","K",":m '<-2<CR>gv=gv")
--This keymap keeps the curor at the center when using half page jumps
vim.keymap.set("n","<C-d>","<C-d>zz")
vim.keymap.set("n","<C-u>","<C-u>zz")
--This keepmap keeps the search terms in the middle of the screen
vim.keymap.set("n","n","nzzzv")
vim.keymap.set("n","N","Nzzzv")
--Removing the stupid ; key bind 
--vim.keymap.set("n",";",".")
