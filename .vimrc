inoremap jj <ESC>
vnoremap <C-c> "+y
nnoremap <C-v> "+p
set number
set smarttab
set smartindent
syntax on
set noerrorbells
set novisualbell
set ruler

let _curfile = expand("%:t")

if _curfile =~ "Makefile" || _curfile =~ "makefile" || _curfile =~ ".*\.mk"
set noexpandtab
else
set expandtab
set tabstop=4
set shiftwidth=4
set foldcolumn=2
endif

  " highlight trailing spaces
   au BufNewFile,BufRead * let b:mtrailingws=matchadd('ErrorMsg', '\s\+$', -1)
   " highlight tabs between spaces
   au BufNewFile,BufRead * let b:mtabbeforesp=matchadd('ErrorMsg', '\v(\t+)\ze( +)', -1)
   au BufNewFile,BufRead * let b:mtabaftersp=matchadd('ErrorMsg', '\v( +)\zs(\t+)', -1)


"Plugins for VIM
call plug#begin('~/.vim/plugged')

"https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

"https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'



call plug#end()

"NERDTree options
autocmd vimenter * NERDTree
map <C-z> :NERDTreeToggle<CR>
set mouse=a
let NERDTreeShowHidden=1

"lightline options
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
