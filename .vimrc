set nocompatible

set visualbell			" Silence the bell, use a flash instead
set formatoptions=tcqor	" t=text, c=comments, q=format with gq command, o,r=autoinsert comment leader
set shiftwidth=4		" set shiftwidth to 4 spaces
set tabstop=4			" set tab to 4 spaces
set showmatch			" Show matching brackets/braces/parantheses.
set background=dark 		" set background to dark
set showcmd			" Show (partial) command in status line.
set autowrite			" Automatically save before commands like :next and :make
"set textwidth=98		" My terminal is 98 characters wide
"set ai					" set autoindent
syntax on

"set guifont=Consolas:h10 
"set guifontwide=MingLiU:h10 "For windows to display mixed character sets
set encoding=utf-8

set spellfile=/home/rat045/dev/Dropbox/thesis/spell/en.utf-8.add
se spell

colorscheme koehler        " use this color scheme
set background=dark        " adapt colors for background

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
