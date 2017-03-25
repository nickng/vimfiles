" Environment {
    " Platform {
        silent function! OSX()
            return has('macunix')
        endfunction
        silent function! LINUX()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
        silent function! WINDOWS()
            return  (has('win32') || has('win64'))
        endfunction
    " }

    " Basics {
        set nocompatible " Vim mode
    " }

    " Windows Compatible {
        " On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
        " across (heterogeneous) systems easier.
        if WINDOWS()
          set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
" }

" General {
    filetype plugin indent on      " Detect file types
    syntax on                      " Syntax highlight
    set mouse=a                    " Enable mouse
    set mousehide                  " Hide cursor while typing
    set number                     " Show line numbers
    set ruler                      " Show line/column number
    set encoding=utf-8             " Display UTF-8
    set textwidth=80               " Auto wrap width
    set colorcolumn=80             " Column bound mark
    set nobackup                   " No backup files
    setlocal spell spelllang=en_gb " Spell check use British English

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
" }

" Package manager {
    if has('nvim')
        if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
            execute '!curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    else
        if empty(glob("~/.vim/autoload/plug.vim"))
            execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
            autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
        endif
    endif
" }

" Packages {
    call plug#begin('~/.vim/bundle')
    Plug 'bartlomiejdanek/vim-dart'
    Plug 'ap/vim-css-color'
    Plug 'kchmck/vim-coffee-script'
    Plug 'tpope/vim-fugitive'
    Plug 'mattn/gist-vim'
    Plug 'othree/html5.vim'
    Plug 'digitaltoad/vim-jade'
    Plug 'pangloss/vim-javascript'
    Plug 'tpope/vim-markdown'
    Plug 'scrooloose/nerdtree'
    Plug 'mmalecki/vim-node.js'
    Plug 'kana/vim-smartinput'
    Plug 'ervandew/supertab'
    Plug 'majutsushi/tagbar'
    Plug 'vim-scripts/taglist.vim'
    Plug 'scrooloose/syntastic'
    Plug 'nickng/vim-scribble'
    Plug 'basepi/vim-conque'
    Plug 'tomasr/molokai'
    Plug 'marijnh/tern_for_vim'
    Plug 'godlygeek/tabular'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'rdnetto/YCM-Generator'
    Plug 'Valloric/YouCompleteMe'
    Plug 'fatih/vim-go'
    Plug 'Blackrush/vim-gocode'
    Plug 'chrisbra/unicode.vim'
    Plug 'rhysd/vim-clang-format'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug 'rust-lang/rust.vim'
    call plug#end()

    " airline configuration {
        source  ~/.vim/airline-nickng.vim
        let g:airline_left_sep=''
        let g:airline_right_sep=''
        let g:airline_detect_spell=0
        let g:airline_powerline_fonts=1
        let g:airline_theme='nickng'
    " }

    " LaTeX Suite configuration {
        let Tex_FoldedSections     = ""
        let Tex_FoldedEnvironments = ""
        let Tex_FoldedMisc         = ""
        autocmd Filetype tex setlocal nofoldenable
        let g:Imap_UsePlaceHolders = 0 " Turn off <++> annoyances
    " }

    " multi-cursor configuration {
        let g:multi_cursor_use_default_mapping=0
        let g:multi_cursor_next_key='<C-m>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
    " }

    " syntastic configuration {
        let g:syntastic_enable_signs=1  " Mark syntax errors with :signs
        let g:syntastic_auto_jump=0     " Automatically jump to the error when saving the file
        let g:syntastic_auto_loc_list=1 " Show the error list automatically
        let g:syntastic_cpp_checkers = [ 'clang_tidy' , 'clang_check' ]
        let g:syntastic_cpp_compiler = 'clang++'
        let g:syntastic_cpp_compiler_options = '-Wall -std=c++14'
        let g:syntastic_c_compiler = 'clang'
        let g:syntastic_c_compiler_options = '-Wall -std=c14'
        let g:syntastic_go_checkers = [ 'golint', 'govet', 'errcheck' ]
        let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
    " }

    "  NERDTree configuration {
        function! StartNerdTree()
        if 0 == argc()
            NERDTree
        end
        endfunction

        let NERDTreeIgnore=['\.pyc$', '\.pyo$', '\.rbc$', '\.rbo$', '\.class$', '\.o$', '\~$']
        let NERDTreeHijackNetrw = 1
        autocmd VimEnter * call StartNerdTree()
        map <F9> :NERDTreeToggle<CR>
    "  }

     " Tagbar configuration {
        nmap <F7> :TagbarToggle<CR>
        imap <F7> <ESC>:TagbarToggle<CR>
     " }

     " YCM configuration {
        let g:ycm_error_symbol = '▸'
        let g:ycm_confirm_extra_conf = 0
     " }

     " go-vim configuration {
        let g:go_list_type = "quickfix"
     " }
" }

" UI {
    set tabpagemax=15               " Only show 15 tabs
    set showmode                    " Display the current mode
    set cursorline                 " Highlight current line

    if has('statusline')
        set laststatus=2
        set statusline=%<%f\                         " Filename
        set statusline+=%w%h%m%r                     " Options
        "set statusline+=%{fugitive#statusline()}     " Git Hotness
        set statusline+=\ [%{&ff}/%Y]                " Filetype
        set statusline+=\ [%{getcwd()}]              " Current dir
        set statusline+=%#warningmsg#                " Warning message colour
        "set statusline+=%{SyntasticStatuslineFlag()} " Syntastic flag
        set statusline+=%*                           " Normal colour
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%      " Right aligned file nav info
    endif

    if has('cmdline_info')
    set ruler                                          " Show ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " Ruler on steroids
    set showcmd                                        " Show partial commands
    endif

    set backspace=indent,eol,start  " Backspace for dummies
    set linespace=0                 " No extra spaces between rows
    set number                      " Line numbers on
    set showmatch                   " Show matching brackets/parenthesis
    set incsearch                   " Find as you type search
    set ignorecase                  " Case non-sensitive search
    set hlsearch                    " Highlight search terms
    set winminheight=0              " Windows can be 0 line high
    set smartcase                   " Case sensitive when uc present
    set wildmenu                    " Show list instead of just completing
    set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
    set scrolljump=5                " Lines to scroll when cursor leaves screen
    set scrolloff=3                 " Minimum lines to keep above and below cursor
    set foldenable                  " Auto fold code

    set list                       " Show invisible characters
    set listchars=""               " Reset the listchars
    set listchars=tab:↦\           " Tab should display as bar-arrow
    set listchars+=trail:⎵         " Show trailing spaces as under sqiuare brace
    set listchars+=extends:◄       " Line extends beyond right edge of screen
    set listchars+=precedes:►      " Line extends beyond left edge of screen
    set fillchars=""               " Reset the fillchars
    set fillchars+=vert:│          " No vertical split chars
    set fillchars+=fold:─          " horizontal split chars

    " Colour {
        colorscheme molokai
        set t_Co=256
        set background=dark
        " Paren colour hack for molokai
        hi MatchParen  ctermfg=208 ctermbg=16  cterm=bold
    " }
" }

" Formatting {
    set autoindent                 " Auto indent
    set shiftwidth=4               " indent 4 space by default
    set shiftround                 " indent/outdent to the nearest tabstop
    set expandtab                   " Tabs are spaces, not tabs
    set smarttab                   " <TAB> indents by shiftwidth
    set tabstop=4                  " Tab stop
    set softtabstop=4               " Let backspace delete indent
    set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
    set splitright                  " Puts new vsplit windows to the right of the current
    set splitbelow                  " Puts new split windows to the bottom of the current

    highlight TrailingWhitespace ctermbg=red guibg=red
    match TrailingWhitespace /\s\+$/

    function! s:setupWrapping()
        set wrap
        set linebreak
        set textwidth=80
        set nolist
    endfunction
" }

" Autocmd {
    if has("autocmd")
        autocmd BufWinEnter * match TrailingWhitespace /s\+$/
        autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
        autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
        autocmd InsertLeave * match TrailingWhitespace /\s\+$/
        autocmd BufWinLeave * call clearmatches()
        autocmd FileType make set noexpandtab

        " Make sure all Markdown files have the correct filetype set and setup wrapping
        autocmd BufNewFile,BufRead *.{md,markdown,mdown,mkd,mkdn,txt} setf markdown | call s:setupWrapping()
        autocmd BufNewFile,BufRead *.{html,html} set tabstop=2 shiftwidth=2

        " Treat JSON files like JavaScript
        autocmd BufNewFile,BufRead *.json set filetype=javascript

        autocmd FileType css,scss set tabstop=2 shiftwidth=2

        autocmd BufNewFile,BufRead *.{sj,maxj} set filetype=java

        " Make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
        autocmd FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

        autocmd FileType javascript,jade set tabstop=2 shiftwidth=2

        autocmd FileType c,cpp,h,hpp set tabstop=4 shiftwidth=4
        if executable('clang-format')
            autocmd FileType cpp,hpp ClangFormatAutoEnable
        endif

        autocmd FileType javascript,coffee set tabstop=2 shiftwidth=2

        autocmd FileType yacc,lex set textwidth=0

        " Remember last location in file, but not for commit messages.
        autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
            \| exe "normal! g`\"" | endif

        " Latex
        autocmd FileType tex set tabstop=2 shiftwidth=2 spell
        autocmd Filetype tex setlocal nofoldenable

        autocmd FileType go set noexpandtab tabstop=4 shiftwidth=4
        autocmd BufWritePost *.go GoTestCompile

        " Switch to working directory of the open file
        " au BufEnter * if expand('%:p') !~ '://' | cd %:p:h | endif
    endif
" }

" Remap keys for tmux {
    " Split screen buffer switching
    " nmap <silent> <A-Up> :wincmd k<CR>
    " nmap <silent> <A-Down> :wincmd j<CR>
    " nmap <silent> <A-Left> :wincmd h<CR>
    " nmap <silent> <A-Right> :wincmd l<CR>
" }


" Use local vimrc if available {
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }

" Use local gvimrc if available and gui is running {
    if has('gui_running')
        if filereadable(expand("~/.gvimrc.local"))
            source ~/.gvimrc.local
        endif
    endif
" }
