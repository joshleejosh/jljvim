
syn region afterCsBrackets start="{" end="}" transparent fold

" This is spellswords specific, but hey.
syn match afterCsAssert "\<SSAssert\>.*$"
hi def afterCsAssert term=NONE ctermfg=LightGray guifg=LightGray
syn match afterCsAssert "\<FAssert\>.*$"
hi def afterCsAssert term=NONE ctermfg=LightGray guifg=LightGray
