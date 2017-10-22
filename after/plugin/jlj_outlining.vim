" Outlining mode includes sensible(ish) bullets and folding
" 
" License: MIT

" INIT STUFF                                               {{{1
if exists("g:JLJOLLoaded") || &cp
  finish
end
let g:JLJOLLoaded = 1

" FOLDING (broken x_x)                                     {{{1

fun! JLJOLFold(lnum)
	if getline(a:lnum) =~ '\v^\s*$'
		return '-1'
	end

	let curind = indent(a:lnum) / &shiftwidth + 1
	let nxtline = <SID>JLJOLNextNonBlank(a:lnum)
	let nxtind = indent(nxtline) / &shiftwidth + 1

	if curind < nxtind
		return '>'.curind
	elseif curind > nxtind
		return '<'.curind
	else
		return '='
	end
endfun

fun! <SID>JLJOLNextNonBlank(lnum)
	let lastln = line('$')
	let i = a:lnum + 1

	while i <= lastln
		if getline(i) !~ '^\s*$'
			return i
		end
		let i = i + 1
	endwhile

	return -2
endfun

" STATUS                                                   {{{1

fun! JLJOLStatusLine()
  let line = '%<%f [outlining] %h%m%r%'
  if &ruler
    let line .= '=%-14.(%l,%c%V%) %P'
  endif
  return line
endfun

" COMMAND                                                  {{{1

fun! <SID>JLJOLEnable()
  setlocal wrap tabstop=2 shiftwidth=2 noexpandtab
  setlocal breakindent breakindentopt=shift\:2 
  setlocal foldmethod=indent
  "setlocal foldmethod=expr
  "setlocal foldexpr=JLJOLFold(v:lnum)
  setlocal statusline=%!JLJOLStatusLine()
endfun

command! Outlining :call <SID>JLJOLEnable()

" }}}
" vim: set foldmethod=marker foldlevel=0:
