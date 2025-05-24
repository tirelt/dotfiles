" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Use raltive line numbers
set rnu
 
" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on
 
" Provides tab-completion for all file-related tasks
set path+=**
 
" Display all matching files when we tab complete
set wildmenu

set tabstop=3
 
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
 
" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings

set scrolloff=8
set incsearch
 
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-d> <C-d>zz0
nnoremap <C-u> <C-u>zz0
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

set background=dark
colorscheme slate                         
