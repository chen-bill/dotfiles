if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

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
        Plugin 'Yggdroot/indentLine'

    " I'm lazy
        Plugin 'jiangmiao/auto-pairs'                   " matching brackets and quotes
        Plugin 'kien/ctrlp.vim'                         " searches all instances
        Plugin 'scrooloose/nerdcommenter'               " ezpz comments
        Plugin 'scrooloose/syntastic'                   " compiler-esque
        Plugin 'scrooloose/nerdtree'                    " blessed tree
        Plugin 'majutsushi/tagbar'                      " blessed tags
        Plugin 'jeffkreeftmeijer/vim-numbertoggle'      " toggleline numbers
        Plugin 'ajh17/VimCompletesMe'                   " autocomplete
        Plugin 'easymotion/vim-easymotion'
        Plugin 'rking/ag.vim'                           " silver search
        Plugin 'tpope/vim-surround'                     " cs'(
        Plugin 'itchyny/vim-cursorword'                 " underlines like words
        Plugin 'mbbill/undotree'                        " trees dope


    " language specific
        "Disabling for now because I'm using Go
        "Plugin 'maksimr/vim-jsbeautify'
        Plugin 'alvan/vim-closetag'                     " html tag
        Plugin 'mxw/vim-jsx'                            " react
        Plugin 'pangloss/vim-javascript'                " javascript
        "Plugin 'jelera/vim-javascript-syntax'          " javascript bracket matching
        "Plugin 'gregsexton/MatchTag'                   " html tag colouring
        "Plugin 'rstacruz/sparkup'                      " html autocomplete, div <C+E>
        Plugin 'terryma/vim-multiple-cursors'           " multiple cursors
        "Plugin 'lfv89/vim-interestingwords'            " highlight search silimar words <leader>k, <leader>K
        Plugin 'suan/vim-instant-markdown'              " markdown
        Plugin 'fatih/vim-go'		  	                " vim for go
        "Plugin 'jodosha/vim-godebug'  	                " go debugging for vim
        "Plugin 'vim-scripts/Conque-Shell'  	        " go debugging for vim
        "Plugin 'vim-scripts/Conque-GDB'  	            " go debugging for vim
        Plugin 'tomlion/vim-solidity'

    " Other
        Plugin 'wikitopian/hardmode'            " :call HardMode(), :call EasyMode()

    " Disabled
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
                exec "GoRun %"
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

    " Easymotion
        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)
        " Move to line
        map <Leader>L <Plug>(easymotion-bd-jk)
        nmap L <Plug>(easymotion-overwin-line)

    " NerdTree
        let NERDTreeShowLineNumbers=1
        autocmd FileType nerdtree setlocal relativenumber

    " HTML close tag
        let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
        let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

    " JSX lint
        let g:jsx_ext_required = 0 

    " Syntastic 
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*

        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_auto_loc_list = 1
        let g:syntastic_check_on_open = 1
        let g:syntastic_check_on_wq = 0

        let g:syntastic_javascript_checkers = ['esline', 'jshint']
        let g:syntastic_go_checkers = ['golint']
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

    " NerdCommenter
        let NERDSpaceDelims=1

    "" Markdown
        "let vim_markdown_preview_hotkey='<leader>m'

    " Tagbar
        let g:tagbar_show_linenumbers = 2

    " Other
        set completeopt-=preview " disables automatic tab window
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
        set nohlsearch


    " Toggle paste mode
        set pastetoggle=<leader>p
		set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
        set backspace=indent,eol,start

    " Better tabs
        " use 4 spaces for tabs
        set tabstop=2 softtabstop=2 shiftwidth=2

    " behavior settings
        set nowrap
        set foldmethod=indent
        set backup
        set backupdir=~/.vimBackup
        set noswapfile
        set number
        set showcmd
        set sidescroll=1
        set conceallevel=0

    " undotree
        if has("persistent_undo")
            set undodir=~/.undodir/
            set undofile
        endif

" Macros/Mappings
    " Plugin Mappings
        map <F2> :NERDTreeToggle<cr>
        map <F3> :UndotreeToggle<cr>
        map <F9> :TagbarToggle<cr>
        map <leader>nt :NERDTree %:p:h<cr>
        map <leader>R :SyntasticReset<cr>
    
    " Golang
        map <leader>b :GoDef<cr>

    " Vim traversal
        map <C-u> 10<C-y>
        map <C-d> 10<C-e>
        map <C-f> 30<C-e>
        map <C-b> 30<C-y>

    " Vim Navigation
        nnoremap <tab> <C-w>w
        nnoremap <S-tab> <C-w>W

    " Vim windows
        nmap <right> :vertical resize +5<cr>
        nmap <left> :vertical resize -5<cr>
        nmap <up> :resize +5<cr>
        nmap <down> :resize -5<cr>

    " Vim copy/pasting
        xnoremap p "_dP
    
    " Vim Language Specific
        " Javascript
            imap cll console.log();<Esc>hi
        " Java
            imap sysout System.out.println();<Esc>hi
        " Go
            imap fmp fmt.Println()<Esc>i
    " Other
        map <M-w> :w

        " visual
            vnoremap / <Esc>/\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
			vnoremap ? <Esc>?\%><C-R>=line("'<")-1<CR>l\%<<C-R>=line("'>")+1<CR>l
