" Vim color file

" This is jl's color scheme. It's probably a mess.

" Set 'background' back to the default.  The value can't always be estimated
" and is then guessed.
hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear
set background=light

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "jl"

hi Normal guifg=gray5 guibg=gray95
"hi Cursor         guifg=bg guibg=fg
"hi lCursor        guifg=bg guibg=fg
"hi CursorColumn guibg=Grey90
"hi CursorLine guibg=Grey90
"hi CursorLineNr gui=bold guifg=gray20
"hi clear CursorIM

" Highlight groups
hi SpecialKey guifg=gray37
hi NonText gui=bold guifg=gray37
hi Directory guifg=gray37
hi ErrorMsg guifg=gray85 guibg=Red
hi IncSearch gui=reverse
hi Search guibg=Yellow
hi MoreMsg gui=bold guifg=gray45
hi ModeMsg gui=bold
hi LineNr guifg=gray20
hi Question gui=bold guifg=gray45
hi StatusLine gui=bold,reverse
hi StatusLineNC gui=reverse
hi VertSplit gui=reverse
hi Title gui=bold guifg=gray56
hi Visual guibg=gray83
hi VisualNOS gui=bold,underline
hi WarningMsg guifg=Red
hi WildMenu guifg=gray37 guibg=Yellow
hi Folded guifg=gray54 guibg=gray83
hi FoldColumn guifg=gray54 guibg=Grey
hi DiffAdd guibg=LightBlue
hi DiffChange guibg=LightYellow
hi DiffDelete gui=bold guifg=gray37 guibg=LightRed
hi DiffText gui=bold guibg=LightGreen
hi SignColumn guifg=gray54 guibg=Grey
hi Conceal guifg=gray83 guibg=DarkGrey
hi SpellBad gui=undercurl guisp=Red
hi SpellCap gui=undercurl guisp=gray37
hi SpellRare gui=undercurl guisp=gray56
hi SpellLocal gui=undercurl guisp=gray40
hi Pmenu guibg=gray70
hi PmenuSel guibg=Grey
hi PmenuSbar guibg=Grey
hi PmenuThumb guibg=Black
hi TabLine gui=underline guibg=gray83
hi TabLineSel gui=bold
hi TabLineFill gui=reverse
hi ColorColumn guibg=LightRed

" syntax groups
hi MatchParen guibg=gray77
hi Comment gui=italic guifg=gray60
hi Constant guifg=gray56
hi Special gui=bold guifg=gray30
hi Identifier guifg=gray20
"hi Function gui=italic
hi Statement gui=bold guifg=gray20
hi PreProc gui=italic guifg=gray55
hi Type gui=bold guifg=gray45
hi Underlined gui=underline guifg=gray30
hi Ignore guifg=gray75
hi Error guifg=gray85 guibg=Red
hi Todo guifg=gray37 guibg=Yellow

