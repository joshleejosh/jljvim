

setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal ts=4 sw=0 expandtab ai
setlocal tw=0 nowrap 

function! NewASClass()
	call SuckThis("asclass")
	let fn=expand("%:t:r")
	normal 7x
	exec "%s/TK1/".fn."/"
	let fd=substitute(expand("%:h:p"), $PWD.'/', '', '')
	let fd=substitute(fd, '/', '.', 'g')
	exec "%s/TK2/".fd."/"
endfunction
map <buffer> +NC :call NewASClass()<CR>

