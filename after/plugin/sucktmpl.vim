" A minimal template-insertion script.
" 
" License: MIT

" INIT STUFF                                               {{{1
if exists('g:SuckTmplLoaded') || &cp
  finish
end
let g:SuckTmplLoaded = 1

let s:path = expand('<sfile>:p:h')
let s:tmpldir = s:path . '/../../sucktmpl_templates'
let s:cursortag = '«Ω»'
let s:taglen = strchars(s:cursortag)

" 'PUBLIC' SCRIPT API                                      {{{1
" for when you want to call this from another script

" List available templates.
fun! SuckTmplList()
  let list = glob(s:tmpldir."/*", 0, 1)
  for fn in l:list
    echo fnamemodify(l:fn, ":p:t")
  endfor
endfun

" Read a template and return its content as a text blob.
" Returns an empty string if the template doesn't exist.
fun! SuckTmplRead(name)
  let fn = s:tmpldir . '/' . a:name
  let found = filereadable(l:fn)
  if !l:found
    echoerr "Template [" . a:name . "] does not exist"
    return ""
  endif
  return join(readfile(l:fn), "\n")
endfun

" Read a template and paste it in at the current position.
fun! SuckTmpl(name)
  let oldreg = @"
  let @" = SuckTmplRead(a:name)
  if strchars(@") == 0
    let @" = l:oldreg
    return
  endif

  normal p
  execute "normal /".s:cursortag."/"
  execute "normal ".s:taglen."x"
  let @" = l:oldreg
endfun

" COMMANDS                                                 {{{1

fun! <SID>SuckTmplCmd(...)
  if a:0 == 0
    call SuckTmplList()
    return
  endif
  for name in a:000
    call SuckTmpl(name)
  endfor
endfun

command! -nargs=* Sucktmpl call <SID>SuckTmplCmd(<f-args>)

" MAPPINGS                                                 {{{1
" and map-driven wrappers

" Replace the word under the cursor with its template.
fun! <SID>SuckTmplNormal()
  let oldreg = @"
  let word = expand("<cword>")

  let @" = SuckTmplRead(l:word)
  if strchars(@") == 0
    let @" = l:oldreg
    return
  endif

  normal viwp
  execute "normal /".s:cursortag."/"
  execute "normal ".s:taglen."x"
  let @" = l:oldreg
endfun

" Replace the selected word with its template.
" FIXME: this clobbers the scratch register; see mapping below.
fun! <SID>SuckTmplVisual(word)
  let @" = SuckTmplRead(a:word)
  if strchars(@") == 0
    " put the word back
    let @" = a:word
    normal P
    return
  endif

  normal P
  execute "normal /".s:cursortag."/"
  execute "normal ".s:taglen."x"
endfun

fun! <SID>SuckTmplInsert()
  " despite the function name, assume that we escaped to normal mode before
  " calling this; see mapping below.
  let oldreg = @"
  let word = expand("<cword>")

  let @" = SuckTmplRead(l:word)
  if strchars(@") == 0
    let @" = l:oldreg
    return
  endif

  normal viwp
  let @" = l:oldreg
  execute "normal /".s:cursortag."/"
  " let the mapping replace the tag.
endfun

let mapleader=";"
noremap  <Leader>tt :call <SID>SuckTmplNormal()<CR>
vnoremap <Leader>tt x:call <SID>SuckTmplVisual(@")<CR>
inoremap <Leader>tt <ESC>:call <SID>SuckTmplInsert()<CR>3s
noremap  <Leader>tl :call SuckTmplList()<CR>

" }}}
" vim: set foldmethod=marker foldlevel=0:
