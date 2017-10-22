runtime! ftplugin/xml.vim

setlocal tw=0 wrap linebreak

let maplocalleader=";"

inoremap <buffer> <LocalLeader>h/ http://
"inoremap <buffer> <LocalLeader>s ><C-Left><C-Left><<C-Right><Right>
"inoremap <buffer> <C-f>$ <$$><Left><Left>

nmap <buffer> <LocalLeader>hp 0i<p><ESC>$a</p><ESC>

vmap <buffer> <LocalLeader>hl <LocalLeader>oa href=""<LocalLeader>c2F"
vmap <buffer> <LocalLeader>hp <LocalLeader>op<LocalLeader>c
vmap <buffer> <LocalLeader>hc <LocalLeader>ocite<LocalLeader>c
vmap <buffer> <LocalLeader>hm <LocalLeader>oem<LocalLeader>c
vmap <buffer> <LocalLeader>hq <LocalLeader>oblockquote<LocalLeader>c
vmap <buffer> <LocalLeader>hs <LocalLeader>ospan class=""<LocalLeader>c2F"

vmap <buffer> <LocalLeader>h1 <LocalLeader>oh1<LocalLeader>c
vmap <buffer> <LocalLeader>h2 <LocalLeader>oh2<LocalLeader>c
vmap <buffer> <LocalLeader>h3 <LocalLeader>oh3<LocalLeader>c
vmap <buffer> <LocalLeader>h4 <LocalLeader>oh4<LocalLeader>c
vmap <buffer> <LocalLeader>h5 <LocalLeader>oh5<LocalLeader>c
vmap <buffer> <LocalLeader>h6 <LocalLeader>oh6<LocalLeader>c

vnoremap <buffer> <LocalLeader>li :s/^.*$/<li>&<\/li>/<CR>

" Strip out all tags matching a name
nnoremap <buffer> <LocalLeader>mk :%s/<\/*\<\>[^>]*\/*>//g<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

vmap <buffer> <LocalLeader>hd :!markdown<CR>

" Bootstrap grid junk
nnoremap <buffer> <LocalLeader>br i<div class="row-fluid"><CR><CR></div><ESC>k
nnoremap <buffer> <LocalLeader>bc i<div class="span4"><CR><CR></div><ESC>k

