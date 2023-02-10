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

" Игнорировать эти форматы файлов в меню
set wildignore+=*.so,*.swp,*.zip,*.gz,*.xz,*.pyc,*.db,*.sqlite,*.jpg,*.png

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
"Install command :PlugInstall
call plug#begin('~/.vim/plugged')

"https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

"https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

"https://github.com/davidhalter/jedi-vim
"Plug 'davidhalter/jedi-vim'

call plug#end()

"NERDTree options
autocmd vimenter * NERDTree
map <C-z> :NERDTreeToggle<CR>
set mouse=a
let NERDTreeShowHidden=1
" Автозакрытие окна NERDTree,
" если сам Vim уже закрыли
autocmd BufEnter *
    \ if (winnr("$") == 1
    \ && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree())
    \ | q | endif


"lightline options
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
        \ &filetype ==# 'unite' ? unite#get_status_string() :
        \ &filetype ==# 'vimshell' ? vimshell#get_status_string() :
        \ expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

let g:unite_force_overwrite_statusline = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

"Jedi options
let g:jedi#auto_initialization = 1
let g:jedi#use_splits_not_buffers = "button"
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_select_first = 0
