" Outlining mode includes sensible bullets and folding

fun! JLJOLFold(lnum)
	if getline(a:lnum) =~ '\v^\s*$'
		return '-1'
	end

	let curind = indent(a:lnum) / &shiftwidth + 1
	let nxtline = JLJOLNextNonBlank(a:lnum)
	let nxtind = indent(nxtline) / &shiftwidth + 1

	if curind < nxtind
		return '>'.curind
	elseif curind > nxtind
		return '<'.curind
	else
		return '='
	end

endfun

fun! JLJOLNextNonBlank(lnum)
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

fun! JLJOLStatusLine()
  let line = '%<%f [outlining] %h%m%r%'
  if &ruler
    let line .= '=%-14.(%l,%c%V%) %P'
  endif
  return line
endfun

fun! JLJOLEnable()
  setlocal wrap tabstop=2 shiftwidth=2 noexpandtab
  setlocal breakindent breakindentopt=shift\:2 
  setlocal foldmethod=indent
  "setlocal foldmethod=expr
  "setlocal foldexpr=JLJOLFold(v:lnum)
  setlocal statusline=%!JLJOLStatusLine()
endfun

command! Outlining :call JLJOLEnable()

