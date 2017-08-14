" This one mostly depends on XML mappings, which should be autoloaded by the
" default ftplugin/xslt.vim

function! XSLNew()
    call SuckTemplate("xsl")
    1d
    /\/\*!!!\*\/
    normal Dzx
endfunction

nnoremap <buffer> <LocalLeader>sN :call XSLNew()<CR>
imap <buffer> <LocalLeader>sa xsl:apply-templates<LocalLeader>e
imap <buffer> <LocalLeader>sA <LocalLeader>sa<LocalLeader>aselect<LocalLeader>v
imap <buffer> <LocalLeader>st xsl:template<LocalLeader>N<ESC>k<LocalLeader>amatch<LocalLeader>v
imap <buffer> <LocalLeader>sv xsl:value-of<LocalLeader>e<LocalLeader>aselect<LocalLeader>v
imap <buffer> <LocalLeader>sb xsl:attribute<LocalLeader>n<ESC><LocalLeader>aname<LocalLeader>v

