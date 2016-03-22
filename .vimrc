" uses vim settings instead of vi settings
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" :PluginInstall
Plugin 'VundleVim/Vundle.vim'

" Pretty
Plugin 'scwood/vim-hybrid'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" I'm lazy
Plugin 'jiangmiao/auto-pairs'
Plugin 'kien/ctrlp.vim'

" Vim better
Plugin 'scrooloose/nerdcommenter'
Plugin 'wookiehangover/jshint.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'Valloric/YouCompleteMe'           " autocomplete
Plugin 'scrooloose/nerdtree'

" language specific
Plugin 'jelera/vim-javascript-syntax'   " javascript bracket matching
Plugin 'gregsexton/MatchTag'            " html tag colouring
Plugin 'rstacruz/sparkup'               " html autocomplete, div <C+E>

call vundle#end()         
filetype plugin indent on

syntax on

" mappings
map <leader>n :NERDTree<cr>

" Airline setings
set laststatus=2
let g:airline_right_sep = ''
let g:airline_left_sep = ''
let g:airline_theme = 'bubblegum'

" Line numbers
nnoremap <leader>g :call NumberToggle()<cr>
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
    else
        set relativenumber
    endif
endfunc

:au FocusLost * :set number
:au FocusGained * :set relativenumber

" tabs
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" line numbers
nnoremap <leader>l :call NumberToggle()<cr>
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" pretty/UI
set background=dark
colorscheme hybrid
set number
set history=50		" keep 50 lines of command line history
set ruler 		" shows cursor
set showcmd		" display incomplete commands

" search
set ignorecase          " ignorecase for search
set smartcase           " case sensitive if at least one is capitalized
set incsearch		" do incremental searching

" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_less_use_less_lint

" Toggle paste mode
set pastetoggle=<leader>p
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set backspace=indent,eol,start

" behavior settings
set nowrap
set foldmethod=indent
set backup

" language based macros
imap cll console.log();<Esc><Left>i
