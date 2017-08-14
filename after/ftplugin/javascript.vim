
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://
setlocal ts=4 sw=0 expandtab ai
setlocal tw=0 nowrap 

let maplocalleader=";"
map <buffer> <LocalLeader>jf O= function() {<CR>}<ESC>kI <LEFT>
imap <buffer> <LocalLeader>jf <SPACE>= function() {<CR><CR>}<UP><UP><C-O>f)

imap <buffer> <LocalLeader>+ '++'<LEFT><LEFT>
