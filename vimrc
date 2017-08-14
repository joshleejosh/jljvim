" Reset all options and autocommands
set all&
autocmd!

set nocompatible       " Not strictly SVR4 vi compatible
set viminfo='20,\"50   " Read/write a .viminfo file, don't store more than 50 lines of registers
set directory=~/tmp
behave xterm

execute pathogen#infect()
filetype on
filetype indent on
filetype plugin on

" BASIC SETTINGS                                        {{{1

set nobackup                 " Don't write stupid backup files
set nohlsearch               " Don't highlight search finds
set cmdheight=2
set winminheight=0
set winheight=10
set ignorecase               " Case-insensitive searching
set autoindent               " Automatically line up indentation
set backspace=2              " allow backspacing over everything in insert mode
set nojoinspaces             " Don't insert 2 spaces when joining lines.
set shortmess=atI            " Abbreviated messages
set novisualbell

set shellpipe=2>&1\ \|\ tee
set shellslash               " forward the forward slash!


" GLOBAL MAPPINGS                                       {{{1

" I always hit F1 by mistake, so disable it by
" remapping it to something harmless.
noremap <F1> <Nop>
noremap! <F1> <Nop>
" Yeah, this one too. How often do I need to go in to ex mode, anyway?
noremap Q <NOP>

" The basics
noremap <C-W> :w<CR>
"noremap \| v
"noremap \ xph
noremap <SPACE> i <ESC>

" The second mapping I ever made in vi was to map * to :%s/ (the first was
" mapping <C-W> to :w<CR>, above). Years later, I started using Vim, and I just
" brought the mapping with me, not realizing that * was infinitely more useful
" in Vim than it ever was in vi. Eventually, I figured out what was going on
" there, but couldn't train my fingers to stop using * for global sub. So I
" mapped & to * and left * mapped to :%s/, which was dumb. Now, the time has
" come to just suck it up and retrain myself. Heigh ho.
noremap & :%s/
noremap +& viwy:%s/\<<C-R>"\>//g<LEFT><LEFT>
noremap +^ viwy:grep '<C-R>"' 

" Why do I like these? So that I can be completely confused when I use a
" vanilla vim instance.
noremap W <C-W>
noremap <C-N> <C-W>w
noremap <C-P> <C-W>W
noremap J <C-E>
noremap K <C-Y>
noremap <C-Y> "*y
noremap <C-E> J


" miscellaneous twitchy commands.                       {{{1
map _L :set lines=65<CR>
map _Z :set lines=65 co=210<CR>
map _C :set co=80<CR>
"map _X :normal!Q<CR>
command! -nargs=1 ToggleOpt :exec "set " . ( (&<args>)?"no":"" ) . "<args>"
map _W :ToggleOpt wrap<CR>
map _I :ToggleOpt ic<CR>
"map _T :set ts=
map _# :e#<CR>
map _E :e!<CR>
map _R gqap
map _F :setlocal ft=
map _G g<C-G>


" build/quickfix hooks                                  {{{1
"map +T :!ctags -R *<CR>
"map +T :Tlist<CR>
map +M :make <CR>
map +R :make run<CR>
map +T :make tags<CR>
map +L :clist<CR>
map +N :cnext<CR>
map +P :cprevious<CR>
"map +C :cc
map +O :cope<CR>
map +D :!git diff % \| cat<CR>


 " Wrap selection in brackets.                           {{{1

fun! s:MakeBraceWrapper(c, d)
  " Extra <C-v>s are added to avoid confusion with any backet-matching plugins.
  execute 'nnoremap ;' .a:c. ' viw"vs<C-v>' .a:c. '<C-r>v<C-v>' .a:d. '<ESC>'
  execute 'vnoremap ;' .a:c. ' "vs<C-v>' .a:c. '<C-r>v<C-v>' .a:d. '<ESC>'
endfun

call s:MakeBraceWrapper('(', ')')
call s:MakeBraceWrapper('[', ']')
call s:MakeBraceWrapper('{', '}')
call s:MakeBraceWrapper('<', '>')
call s:MakeBraceWrapper('«', '»')
call s:MakeBraceWrapper('"', '"')
call s:MakeBraceWrapper("'", "'")
call s:MakeBraceWrapper('`', '`')
call s:MakeBraceWrapper('“', '”')
call s:MakeBraceWrapper('‘', '’')


" more boring but handy mappings.                       {{{1

" I like these tag navigators switched.
noremap g<C-]> g]
noremap g] g<C-]>

" Launch the directory browser plugin.
map ,e :Explore<CR>
map ,E :Sexplore<CR>

" open up scratch files for quick editing.
command! -nargs=1 Scratch :sp /tmp/scratch.<args> | %d
map ,ss :Scratch 
map ,st :Scratch txt<CR>
map ,sh :Scratch html<CR>


" TEMPORARY MAPPINGS - Clean these up when you're done! {{{1



" }}}
" vim: foldmethod=marker foldlevel=0:
