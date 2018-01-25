" uses vim settings instead of vi settings
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

    " :PluginInstall
        Plugin 'VundleVim/Vundle.vim'

    " Pretty
        Plugin 'scwood/vim-hybrid'
        "Plugin 'sickill/vim-monokai'
        Plugin 'vim-airline/vim-airline'
        Plugin 'vim-airline/vim-airline-themes'
        Plugin 'Yggdroot/indentLine.git'

    " I'm lazy
        Plugin 'jiangmiao/auto-pairs'                   " matching brackets and quotes
        Plugin 'kien/ctrlp.vim'                         " searches all instances
        Plugin 'scrooloose/nerdcommenter'               " ezpz comments
        Plugin 'scrooloose/nerdtree'                    " blessed tree
        Plugin 'jeffkreeftmeijer/vim-numbertoggle'      " toggleline numbers
        Plugin 'ajh17/VimCompletesMe'                   " autocomplete
        Plugin 'easymotion/vim-easymotion'
        Plugin 'rking/ag.vim'                           " silver search
        Plugin 'tpope/vim-surround'                     " cs'(
        Plugin 'itchyny/vim-cursorword'                 " underlines like words
        Plugin 'mbbill/undotree'                        " trees dope
        Plugin 'terryma/vim-multiple-cursors'       " multiple cursors
        Plugin 'lfv89/vim-interestingwords'         " highlight search silimar words <leader>k, <leader>K

        Plugin 'scrooloose/syntastic'                   " compiler-esque

    " language specific
        Plugin 'nvie/vim-flake8'
        "Plugin 'maksimr/vim-jsbeautify'
        "Plugin 'pangloss/vim-javascript'
        "Plugin 'jelera/vim-javascript-syntax'       " javascript bracket matching
        "Plugin 'gregsexton/MatchTag'                " html tag colouring
        "Plugin 'rstacruz/sparkup'                   " html autocomplete, div <C+E>
        "Plugin 'suan/vim-instant-markdown'          " markdown


    " Other

    " Disabled
        " Plugin 'wikitopian/hardmode'            " :call HardMode(), :call EasyMode()
        " Plugin 'wookiehangover/jshint.vim'
        " Plugin 'Valloric/YouCompleteMe'           " autocomplete
        " Plugin 'SirVer/ultisnips.git'           " java snippest
        " Plugin 'honza/vim-snippets'
    
    call vundle#end()         
    filetype plugin indent on
    syntax on

" custom functions
    " compiler
        map <F8> :call CompileRunGcc()<CR>
        func! CompileRunGcc()
            exec "w"
            exec "!clear"
            if &filetype == 'c'
                exec "!gcc % -o %<"
                exec "!time ./%<"
            elseif &filetype == 'cpp'
                "exec !g++ % -o %<
                "exec !g++ -std=c++14 % -o %< -Wall -Wextra -Wconversion
                exec "!g++ -std=c++14 % -o %<"
                exec "!time ./%<"
            elseif &filetype == 'java'
                exec "!javac %"
                exec "!time java -cp %:p:h %:t:r"
            elseif &filetype == 'sh'
                exec "!time bash %"
            elseif &filetype == 'python'
                exec "!time python2.7 %"
            elseif &filetype == 'html'
                exec "!firefox % &"
            elseif &filetype == 'go'
                exec "!go build %<"
                exec "!time go run %"
            elseif &filetype == 'mkd'
                exec "!~/.vim/markdown.pl % > %.html &"
                exec "!firefox %.html &"
            endif
        endfunc

" Plugin Settings
    " Airline setings
        set laststatus=2
        let g:airline_right_sep = ''
        let g:airline_left_sep = ''
        let g:airline_theme = 'bubblegum'

    " Flake8
        let g:flake8_show_in_gutter = 1

    " Easymotion
        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)
        " Move to line
        map <Leader>L <Plug>(easymotion-bd-jk)
        nmap L <Plug>(easymotion-overwin-line)

    " NerdTree
        let NERDTreeShowLineNumbers=1
        autocmd FileType nerdtree setlocal relativenumber

    " Syntastic 
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0

        let g:syntastic_javascript_checkers = ['jshint']
        let g:syntastic_python_checkers = ['flake8']
        let g:syntastic_cpp_compiler = 'clang++'
        let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
        let g:syntastic_css_checkers = ['csslint']
        let g:syntastic_mode_map = { 'passive_filetypes': ['java']  }
        " disables syntastic for java because I have eclim
    
    " vertical line indentation
        let g:indentLine_color_term = 239
        let g:indentLine_color_gui = '#09AA08'
        let g:indentLine_char = '│'

    " Pretty Javascript
    map <c-a> :call JsBeautify()<cr>

    " You Complete me
    let g:ycm_filetype_blacklist = { 'java': 1 }

    " Autocomplete
    autocmd FileType text,markdown let b:vcm_tab_complete = 'dict'
    autocmd FileType java inoremap <leader><tab> <C-x><C-u>

    " Multiple cursors
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_next_key='<C-m>'
        let g:multi_cursor_prev_key='<C-k>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'

    "" Markdown
        "let vim_markdown_preview_hotkey='<leader>m'

" Native vim settings
    " pretty/UI
        set background=dark
        colorscheme hybrid
        set history=50      " keep 50 lines of command line history
        set ruler       " shows cursor
        set showcmd     " display incomplete commands

    " search
        set ignorecase          " ignorecase for search
        set smartcase           " case sensitive if at least one is capitalized
        set incsearch            " do incremental searching
        set nohlsearch            " do disable search highlighting


    " Toggle paste mode
        set pastetoggle=<leader>p
        set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
        set backspace=indent,eol,start

    " Better tabs
        " use 4 spaces for tabs
        set tabstop=4 softtabstop=4 shiftwidth=4

    " behavior settings
        set nowrap
        set foldmethod=indent
        set backup
        set backupdir=~/.vimBackup
        set noswapfile
        set number
        set showcmd
        set sidescroll=1
        set shell=/bin/zsh

    " undotree
        if has("persistent_undo")
            set undodir=~/.undodir/
            set undofile
        endif

" Macros/Mappings
    " Plugin Mappings
        map <F2> :NERDTreeFind<cr>
        map <F3> :UndotreeToggle<cr>
        map <leader>R :SyntasticReset<cr>

    " Vim traversal
        map <C-u> 10<C-y>
        map <C-d> 10<C-e>
        map <C-f> 30<C-e>
        map <C-b> 30<C-y>
        map <up> <nop>
        map <down> <nop>
        map <left> <nop>
        map <right> <nop>

    " Vim Navigation
        nnoremap <tab> <C-w>w
        nnoremap <S-tab> <C-w>W

    " Vim windows
        " resize horzontal split window
        nmap <Left> :vertical resize +5<cr>
        nmap <Right> :vertical resize -5<cr>

        " resize vertical split window
        nmap <Up> :vertical resize +5<cr>
        nmap <Down> :vertical resize -5<cr>

    " Vim copy/pasting
        xnoremap p "_dP
    
    " Vim Language Specific
        " Javascript
            imap cll console.log();<Esc><Left>i
        " Java
            imap sysout System.out.println();<Esc>hi

    " Other
        map <M-w> :w

        " visual
            vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
            vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l

