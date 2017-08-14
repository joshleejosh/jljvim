set guioptions-=a  " Don't auto copy to clipboard in visual mode
set guioptions-=P
set guioptions-=A
set guioptions-=c  " GUI dialogs
set guioptions+=e  " GUI tab bar
set guioptions-=m  " No menu bar (in win/x11)
set guioptions+=g  " Grey out disabled menu items instead of hiding
set guioptions-=T  " No toolbar
set guioptions-=r  " No side scrollbars
set guioptions-=R
set guioptions-=l
set guioptions-=L
set guioptions-=b  " No bottom scrollbar
set guioptions-=h

set guifont=Menlo:h12

set laststatus=2
set ruler

" D-x/c/v are already mapped in MacVim
"noremap <D-x> "*d
"noremap <D-c> "*y
"noremap <D-v> "*p
" Shift-Cmd-C to copy a whole line
noremap <D-C> "*yy
" Opt-C to copy all
noremap Ç :%yank *<CR>

colorscheme jl
syntax on

