
setlocal ts=4 sw=0 expandtab
set foldmethod=syntax
setlocal formatoptions=tcql tw=0 cindent
setlocal comments=sr:/*,mb:*,el:*/,://

" indent case statements like normal blocks
setlocal cinoptions=l1

"let maplocalleader=","
"nnoremap <buffer> <LocalLeader>nf :set noai nocindent<CR>o/*<CR>*/<CR>int @@()<CR>{<CR>char *function = "@@";<CR><CR>return(0);<CR>} /* @@ */<CR>:set ai cindent<CR>9k:.,+8s/@@/

" comment/uncomment a line
"map + 0i/*$a*/j
"map = :.s/^\/\*//<CR>:.s/\*\/$//<CR>j

nnoremap <buffer> <F5> :make run<CR>

