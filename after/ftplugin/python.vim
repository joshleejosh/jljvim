
function! JSLPythonRunThis()
	exec "!python ".expand("%")
endfunction

setlocal ts=4 sw=4 tw=0 nowrap
setlocal expandtab
setlocal autoindent " See also plugins for PEP8-style indentation
"set foldmethod=indent

nnoremap <buffer> <F5> :call JSLPythonRunThis()<CR>

