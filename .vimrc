" GUI
"set gfn=Ohsnap\ 11
set go=aegm
set guicursor=a:blinkon0 "n-v-c:block-Cursor-blinkon0,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor-blinkon0,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set guifont=Consolas
set lines=50 columns=180

" Colors
set t_Co=256
syntax on
colorscheme red-v3 "classytouch 

" Enable plugins
set nocp

" no undo file
set noundofile

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
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end
"au BufRead,BufNewFile * exe "set ttymouse=xterm"

"gui
set guioptions-=e
set guioptions-=m
set guioptions-=T

" misc
set encoding=utf-8
set scrolloff=3
set autoindent
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


" search features
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" Line handling
set wrap
set textwidth=79
set formatoptions=tqrn1
"set colorcolumn=85

" Backup files
"set nobackup
"set nowritebackup
"set undofile
set backupdir=~/.tmp/.vim,/tmp
set directory=~/.tmp/.vim,/tmp
set noswapfile

" Change leader key
let mapleader="`"

" line separation appearance
set fillchars+=vert:\.

" Commands
"command CDDEV cd /mnt/D/dev
command CDC cd %:p:h


" Use rainbow parenthesis for lisp editing
"au Syntax * RainbowParenthesesLoadRound
"map <leader>r :RainbowParenthesesToggleAll<CR>
"au FileType lisp,scheme :RainbowParenthesesToggleAll

" Automatically save files when going out of focus
au FocusLost * :wa

" Key remaps for window navigation
nnoremap<C-h> <C-w>h
nnoremap<C-j> <C-w>j
nnoremap<C-k> <C-w>k
nnoremap<C-l> <C-w>l
nnoremap tp :tabp<CR>
nnoremap tn :tabn<CR>

" Helper remap
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
inoremap <F1> <ESC>

nnoremap <S-k> {
vnoremap <S-k> {
nnoremap <S-j> }
vnoremap <S-j> }

"set ofu=syntaxcomplete#Complete

" Disable auto commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Operators coloration in C and C++ files 
autocmd BufRead,BufNewFile *.cpp,*.hpp,*.c,*.h syn match redOperator /[{}()\.\<\>\=\!\+\-\*\[\]]/ | hi link redOperator Operator

" GLSL highlighting
autocmd BufNewFile,BufRead *.glsl,*.fs,*.vs set syntax=glsl

" GO highlighting
au BufRead,BufNewFile *.go set filetype=go

" Personal C/C++ types
autocmd BufRead,BufNewFile *.cpp,*.hpp,*.c,*.h syn keyword Type real32 real64 int8 uint8 int16 uint16 int32 uint32 int64 uint64 

" TODO & NOTE highlighting
autocmd BufNewFile,BufRead *.cpp,*.hpp,*.c,*.h match tag /NOTE/

" NERDTREE Options
let NERDTreeIgnore=['\.o$', '\~$', 'tags']

" OmniCPP Options
set omnifunc=syntaxcomplete#Complete
let OmniCpp_NamespaceSearch = 2     " search namespace in this and included files
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show func prototype
let OmniCpp_SelectFirstItem = 2     " select first opt but dont insert
let OmniCpp_MayCompleteDot = 1      " autocomplete .
let OmniCpp_MayCompleteArrow = 1    " autocomplete ->
let OmniCpp_MayCompleteScope = 1    " autocomplete ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set completeopt=menuone

" Map
" F1 To Open NERDTree
map <silent> <F2> :NERDTreeToggle<CR>
" F2 To VimCommander
" map <silent> <F2> :cal VimCommanderToggle()<CR>
" F12 To rebuild local CTAGS Database
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" Ctrl-X F12 To rebuild global CTAGS Database
map <C-x><F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -f ~/.vim/tags/commontags /usr/include /usr/local/include <CR><CR>


set tags +=~/.vim/tags/gl
set tags +=~/.vim/tags/glfw
set tags +=~/.vim/tags/commontags


" TABLINE
function! Tabline()
  let s = ''
  for i in range(tabpagenr('$'))
    let tab = i + 1
    let winnr = tabpagewinnr(tab)
    let buflist = tabpagebuflist(tab)
    let bufnr = buflist[winnr - 1]
    let bufname = bufname(bufnr)
    let bufmodified = getbufvar(bufnr, "&mod")

    let s .= '%' . tab . 'T'
    let s .= (tab == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . tab .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor

  let s .= '%#TabLineFill#'
  return s
endfunction
set tabline=%!Tabline()

