
setlocal comments=sr:/*,mb:*,el:*/,://
setlocal ts=4 sw=0 expandtab ai
setlocal tw=0 nowrap

setlocal foldmethod=syntax

imap <buffer> ;+ " +  + "<LEFT><LEFT><LEFT><LEFT>
ab <buffer> for() for () {<CR>}<UP><RIGHT><RIGHT><RIGHT><RIGHT>
ab <buffer> foreach() foreach () {<CR>}<UP><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT><RIGHT>
ab <buffer> if() if () {<CR>}<UP><RIGHT><RIGHT><RIGHT>

