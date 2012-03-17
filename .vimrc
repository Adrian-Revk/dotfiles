" GUI
set gfn=Envy\ Code\ R\ 8
set go=aegm
set guicursor=a:blinkon0 "n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor-blinkon0,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175


" Couleurs
set t_Co=256
syntax on
colorscheme red-v3

" Enable plugins
set nocp

" Filetype stuff On
filetype plugin on
filetype indent on
filetype on

" indent length
set sw=4
set tabstop=4	
set softtabstop=4
set expandtab

" complete mouse usage (and in screen too)
set mouse=a
au BufRead,BufNewFile * exe "set ttymouse=xterm"

" misc
set encoding=utf-8
set scrolloff=3
set autoindent
set showmatch
set showcmd
set showmode
set nocompatible
set modelines=0
set relativenumber
set hidden
set wildmenu
set wildmode=list:longest
set novisualbell
"set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set undofile

set ignorecase
set smartcase


" Commands
command CDDEV cd /mnt/D/dev


" Key remaps for window navigation
nnoremap<C-h> <C-w>h
nnoremap<C-j> <C-w>j
nnoremap<C-k> <C-w>k
nnoremap<C-l> <C-w>l

"set ofu=syntaxcomplete#Complete

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Operators coloration in C and C++ files 
autocmd BufRead,BufNewFile *.cpp,*.hpp,*.c,*.h syn match redOperator /[{}()\+\-\*\[\]]/ | hi link redOperator Operator

" GLSL highlighting
autocmd BufNewFile,BufRead *.fs,*.vs set syntax=glsl

" GO highlighting
au BufRead,BufNewFile *.go set filetype=go

" NERDTREE Options
let NERDTreeIgnore=['\.o$', '\~$', 'tags']

" OmniCPP Options
let OmniCpp_NamespaceSearch = 2     " search namespace in this and included files
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 0
let OmniCpp_ShowPrototypeInAbbr = 1 " show func prototype
let OmniCpp_SelectFirstItem = 2     " select first opt but dont insert
let OmniCpp_MayCompleteDot = 1      " autocomplete .
let OmniCpp_MayCompleteArrow = 1    " autocomplete ->
let OmniCpp_MayCompleteScope = 1    " autocomplete ::
set completeopt=menu

" Map
" F1 To Open NERDTree
map <F1> :NERDTreeToggle<CR>
" F2 To VimCommander
map <silent> <F2> :cal VimCommanderToggle()<CR>
" F12 To rebuild local CTAGS Database
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR><CR>
" Ctrl-X F12 To rebuild global CTAGS Database
map <C-x><F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tags/commontags /usr/include /usr/local/include <CR><CR>


set tags +=~/.vim/tags/gl
set tags +=~/.vim/tags/glfw
set tags +=~/.vim/tags/commontags
