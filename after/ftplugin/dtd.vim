
setlocal iskeyword+=-

let maplocalleader=";"

nnoremap <buffer> <LocalLeader>e viws<!ELEMENT  ()><ESC>3hPf(a
imap     <buffer> <LocalLeader>e <ESC><LocalLeader>e
nnoremap <buffer> <LocalLeader>a viws<!ATTLIST  ><ESC>hPf>i
imap     <buffer> <LocalLeader>a <ESC><LocalLeader>a
nnoremap <buffer> <LocalLeader>n viws<!ENTITY %  ""><ESC>3hPf"a
imap     <buffer> <LocalLeader>n <ESC><LocalLeader>n
inoremap <buffer> <LocalLeader>p #PCDATA
inoremap <buffer> <LocalLeader>m EMPTY
inoremap <buffer> <LocalLeader>1 <!--  --><Left><Left><Left><Left>
imap     <buffer> <LocalLeader>! <LocalLeader>1<Left><CR><CR><Up>

