" uses vim settings instead of vi settings
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Plugins
    " :PluginInstall
        Plugin 'VundleVim/Vundle.vim'

    " Pretty
        Plugin 'scwood/vim-hybrid'
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'

    " I'm lazy
        Plugin 'jiangmiao/auto-pairs'
        Plugin 'kien/ctrlp.vim'
        Plugin 'scrooloose/nerdcommenter'               " ezpz comments
        Plugin 'scrooloose/syntastic'                   " compiler-esque
        Plugin 'scrooloose/nerdtree'                    " blessed tree
        Plugin 'jeffkreeftmeijer/vim-numbertoggle'      " toggleline numbers
        Plugin 'ajh17/VimCompletesMe'                   " autocomplete
        Plugin 'easymotion/vim-easymotion'

    " language specific
        Plugin 'maksimr/vim-jsbeautify'
        Plugin 'pangloss/vim-javascript'
        Plugin 'jelera/vim-javascript-syntax'   " javascript bracket matching
        Plugin 'gregsexton/MatchTag'            " html tag colouring
        Plugin 'rstacruz/sparkup'               " html autocomplete, div <C+E>

    " Disabled
        " Plugin 'wookiehangover/jshint.vim'
        " Plugin 'Valloric/YouCompleteMe'           " autocomplete
    
    call vundle#end()         
    filetype plugin indent on

    syntax on

" Plugin Settings
    " Airline setings
        set laststatus=2
        let g:airline_right_sep = ''
        let g:airline_left_sep = ''
        let g:airline_theme = 'bubblegum'

    " Easymotion
        " <Leader>f{char} to move to {char}
        map  <Leader>f <Plug>(easymotion-bd-f)
        nmap <Leader>f <Plug>(easymotion-overwin-f)
        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)
        " Move to line
        map <Leader>L <Plug>(easymotion-bd-jk)
        nmap L <Plug>(easymotion-overwin-line)
        " Move to word
        map  <Leader>w <Plug>(easymotion-bd-w)
        nmap <Leader>w <Plug>(easymotion-overwin-w)

    " Syntastic 
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0

        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_css_checkers = ['csslint']
        " let g:syntastic_mode_map = { 'passive_filetypes': ['python']  }
        " disables syntastic for python

    " Pretty Javascript
    map <c-a> :call JsBeautify()<cr>

    " Autocomplete
    autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'

" Native vim settings
    " pretty/UI
        set background=dark
        colorscheme hybrid
        set history=50		" keep 50 lines of command line history
        set ruler 		" shows cursor
        set showcmd		" display incomplete commands

    " search
        set ignorecase          " ignorecase for search
        set smartcase           " case sensitive if at least one is capitalized
        set incsearch		" do incremental searching

    " Toggle paste mode
        set pastetoggle=<leader>p
        set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
        set backspace=indent,eol,start

    " behavior settings
        set nowrap
        set foldmethod=indent
        set backup

" Macros/Mappings
    " Plugin Mappings
        map <F2> :NERDTreeToggle<cr>
        map <leader>nt :NERDTree %:p:h<cr>
        map <leader>R :SyntasticReset<cr>

    " Vim traversal
        nmap <C-tab> i<tab><Esc>
        map <C-u> 5<C-y>
    	map <C-d> 5<C-e>
        map <C-b> 20<C-e>
        map <C-f> 20<C-y>

    " Vim Language Specific
        imap cll console.log();<Esc><Left>i
        imap <C-z> <C-w>

    " Other
        map <M-w> :w
