" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Use line numbers
set rnu

" enable mouse support
set mouse=a
 
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
 
" Provides tab-completion for all file-related tasks
set path+=**
 
" set leader 
let mapleader=","

" Display all matching files when we tab complete
set wildmenu

set tabstop=3
set shiftwidth=4
set autoindent
set smartindent

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
 
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

set scrolloff=8

" Search
set incsearch " highlight results of search
set hlsearch " highlight search
set ignorecase " search case insensitive 
set smartcase " except if we search uppercase
" Clear search highlights with <leader>/
nnoremap <leader>/ :nohlsearch<CR>

" Persistent undo 
set undofile
set undodir=~/.vim/undo

" highlight matching parentheses / brackets
set showmatch

" yank to system clipoard with Y and keep the cursor at the end of the
" selection
xnoremap y ygv<Esc>
vnoremap <C-y> "+ygv<Esc>
nnoremap <C-p> "+p

" Move up/down selected text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Replace word under cursor in selected text
vnoremap s :s/\<<C-r><C-w>\>/<C-r><C-w>/g<left><left>

" Reselect text after indenting
vnoremap < <gv
vnoremap > >gv

" Center cursor after next/prev search and ctrl+u/d
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv

" Replace word under cursor
nnoremap s :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<left><left><left>

set background=dark
colorscheme slate

" Autoclosing

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>
