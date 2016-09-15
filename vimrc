" All system-wide defaults are set in $VIMRUNTIME/archlinux.vim (usually just
" /usr/share/vim/vimfiles/archlinux.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vimrc), since archlinux.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing archlinux.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.
runtime! archlinux.vim

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

" Make vim source the working directory for vimrc, allowing different vimrcs
" for different projects. enable secure mode because that opens insecurities.
"set exrc
"set secure

" needed for pathogen/plugins
set nocompatible
filetype plugin on
syntax on
execute pathogen#infect()
set fileformat=unix


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++++++++++++  Basics  +++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

set history=200		" keep 200 lines of command line history
set showcmd			" display incomplete commands
set wildmenu		" display completion matches in a status line
set ignorecase      " ignore case for all lowercase searches
set smartcase       " dont ignore case for searches with upper case letters
set number  		" enable numbered lines
set laststatus=2    " Always show statusline
set colorcolumn=90  " Set highlighted column

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set expandtab


"--------------------------------------  Colors  ---------------------------------------
highlight ColorColumn ctermbg=darkgrey

highlight StatusLine ctermbg=15 ctermfg=8


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++++++++++++  Bindings  +++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Set leader to spacebar(default is \)
let mapleader="\<space>"

" let Y copy to system clipboard
nnoremap Y "+y

" toggle relative line numbers
nnoremap <leader>n :set relativenumber!<cr>


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++++++++++++  Functions  ++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

" Show difference between the current buffer and the file it was
" loaded from, thus the changes you made. Revert with ":delcommand DiffOrig"
if !exists("DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis 
	\ | wincmd p | diffthis
endif


"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
"++++++++++++++++++++++++++++++++++++++  Plugins  ++++++++++++++++++++++++++++++++++++++
"+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

"-------------------------------------- Super Tab --------------------------------------
" Make SuperTab's tab completion start at the top and move down.
let g:SuperTabDefaultCompletionType="<c-n>"


"-------------------------------------- Syntastic --------------------------------------
" syntastic recomended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_ew = 0

" Python
let python_highlight_all = 1


