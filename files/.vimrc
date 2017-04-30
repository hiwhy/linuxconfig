set number
execute pathogen#infect()
call pathogen#helptags()
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif


let mapleader=","

set hlsearch
set number
set cursorline
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
set scrolloff=8
set sidescroll=4
nnoremap j gj
nnoremap k gk

" search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

set shiftwidth=2  " number of spaces to use for autoindenting
set smartindent
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=2     " tabs are n spaces

" quickly strip all trailing whitespace in the current file
nnoremap <leader>rw :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>l :set cursorline! <CR>
nnoremap <leader>c :set cursorcolumn! <CR>
nnoremap <leader><space> :noh<cr>
