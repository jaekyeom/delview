" #########################################################
" # A way to delete 'mkview'
function! MyDeleteView()
	let path = fnamemodify(bufname('%'),':p:~')
	let path = substitute(path, '=', '==', 'g')
	let path = substitute(path, '/', '=+', 'g') . '='
	" view directory
	let path = &viewdir.'/'.path
  bdelete
	call delete(path)
	echo "Deleted: ".path
endfunction
command Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>
