colorscheme slate

syntax on
filetype on

set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4
set smartindent
set scrolloff=8
set number
set noswapfile
set numberwidth=12
set backspace=indent,eol,start

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <End>

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap ;q <C-^>"
nnoremap - :Exp<CR>
nnoremap _ :e!<CR>
set tabstop=4
set shiftwidth=4
set smartindent
set scrolloff=8
set number
set noswapfile
set numberwidth=12
set backspace=indent,eol,start

inoremap <C-p> <Up>
inoremap <C-n> <Down>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <End>

nnoremap J 5j
nnoremap K 5k
vnoremap J 5j
vnoremap K 5k

inoremap " ""<Left>
inoremap ' ''<Left>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

nnoremap ;q <C-^>"
nnoremap - :Exp<CR>
nnoremap _ :e!<CR>
