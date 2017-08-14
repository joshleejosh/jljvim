
function! XMLCheatSheet()
    echo "XML Mode:"
    echo "  ;n/;N   turn the word under the cursor into a new element."
    echo "  ;e      turn the word under the cursor into an empty element."
    echo "  ;a      add an attribute to the element under the cursor."
    echo "     ;v   add the value to the attribute you're editing."
    echo "  ;1/;!   insert a comment."
    echo "  ;he     insert a header 'xml' PI tag."
    echo "  ;ds/;di insert a DOCTYPE tag."
    echo "  ;o/;c   (visual mode only) open/close a tag around the selection."
    echo " "
    let t = input("press \<CR\> to continue: ")
endfunction

function! XMLWrapInTag()
    let $text=@x
    let $tag=input("Tag name? ")
    let @x="<".$tag.">".$text."</".$tag.">"
    normal "xP
endfunction

" Even though colon has a specific meaning in the context of namespaces,
" it's still a part of NMTOKEN.
setlocal iskeyword+=:
setlocal iskeyword+=-
setlocal iskeyword+=.

setlocal ts=4 sw=0 tw=0 nowrap
setlocal expandtab
setlocal foldmethod=syntax
setlocal ai

let maplocalleader=";"

nnoremap <buffer> <LocalLeader>n viws<<C-R>"><<C-R>"/><C-O>F<
imap     <buffer> <LocalLeader>n <ESC><LocalLeader>n
nmap     <buffer> <LocalLeader>N <LocalLeader>n<CR><CR><UP>
imap     <buffer> <LocalLeader>N <ESC><LocalLeader>N
nnoremap <buffer> <LocalLeader>e viws<<C-R>" /><ESC>
imap     <buffer> <LocalLeader>e <ESC><LocalLeader>ea

nnoremap <buffer> <LocalLeader>a va>v?[^/> <TAB>]<CR>a =""<LEFT><LEFT><LEFT>
inoremap <buffer> <LocalLeader>a <SPACE>=""<LEFT><LEFT><LEFT>
imap     <buffer> <LocalLeader>v <RIGHT><RIGHT>

inoremap <buffer> <LocalLeader>1 <!--  --><C-o>3h
imap     <buffer> <LocalLeader>! <LocalLeader>1<CR><CR><UP>
nnoremap <buffer> <LocalLeader>he O<?xml version="1.0" encoding="UTF-8"?><CR><ESC>
nnoremap <buffer> <LocalLeader>ds O<!DOCTYPE  SYSTEM ""><CR><ESC>k$10hi
inoremap <buffer> <LocalLeader>ds <!DOCTYPE  SYSTEM ""><CR><ESC>k$10hi
nnoremap <buffer> <LocalLeader>di O<!DOCTYPE  [<CR>]><ESC>k$hi
inoremap <buffer> <LocalLeader>di <!DOCTYPE  [<CR>]><ESC>k$hi

vnoremap <buffer> <LocalLeader>c di<![CDATA[]]><esc>hhP
vnoremap <buffer> <LocalLeader>o c<><C-r>"</><ESC>?<><CR>a
inoremap <buffer> <LocalLeader>c <ESC>F<lviwy/<\/><CR>lp
" wrap the current line
nnoremap <buffer> <LocalLeader>o A</><ESC>I<><LEFT>

nnoremap <buffer> <LocalLeader>? :call XMLCheatSheet()<CR>

vnoremap <buffer> <LocalLeader>w "xd:call XMLWrapInTag()<CR>
vnoremap <buffer> <LocalLeader>1 c<!--   --><ESC>hhhhP

