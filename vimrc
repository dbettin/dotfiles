 set nocompatible
 let mapleader = ","
 filetype off

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " tmux integration
 Bundle 'christoomey/vim-tmux-navigator'

 " send to tmux pane
 Bundle 'xaviershay/tslime.vim'

 " original repos on github
 Bundle 'L9'

 " super tab for autocompletion
 Bundle 'ervandew/supertab'

 " tree based navigation
 Bundle 'scrooloose/nerdtree'

 " commenting helpers
 Bundle 'scrooloose/nerdcommenter'

 " Surrond stuff with things. ysiw" surrounds a word with quotes cs"' changes " to '
 Bundle 'tpope/vim-surround'

 " Shows syntax errors on several types of files
 Bundle 'scrooloose/syntastic'

 " Scala support
 Bundle 'derekwyatt/vim-scala'

 " Run specs or cucumber features with ,t run only the test under the cursor
 " with ,T also remembers last run test so you can hit it again on non-test
 " files to run the last run test
 "Bundle 'skalnik/vim-vroom'

 " Updated ruby syntax and such
 "Bundle 'vim-ruby/vim-ruby'

 " Some syntax highlighthing for rails and :Rextract to extract partials
 "Bundle 'tpope/vim-rails'

 " Improved javascript indentation
 Bundle 'pangloss/vim-javascript'

 " Open a file (like cmd-t but better). Use ,f or ,j(something, see bindings below)
 Bundle 'kien/ctrlp.vim'

 " Adds :Ack complete w/ quick fix
 Bundle 'mileszs/ack.vim'

 " Makes css colors show up as their actual colors, works better with CSApprox or macvim
 Bundle 'ap/vim-css-color'

 " Codeschool theme port
 Bundle '29decibel/codeschool-vim-theme'

 " Hybrid theme port
 Bundle 'w0ng/vim-hybrid'

 " Add python mode support for pep8, pylint, and pydoc
 " Bundle 'klen/python-mode'

 " Vim statusline/tabline that is light as air
 Bundle 'bling/vim-airline'

 " Golang Bundles
 Bundle 'jnwhiteh/vim-golang'
 Bundle 'Blackrush/vim-gocode'

 " Dart Support
 Bundle 'dart-lang/dart-vim-plugin'

 " Time tracking
 " need api key during install
 Bundle 'wakatime/vim-wakatime'

 " Ag searches text in files
 " Note: dependency on 'the_silver_searcher' to install on Mac
 " brew install the_silver_searcher
 Bundle 'rking/ag.vim'

 " Clojure vim files
 Bundle 'guns/vim-clojure-static'
 "Bundle 'kien/rainbow_parentheses.vim'
 Bundle 'amdt/vim-niji'
 Bundle 'tpope/vim-fireplace'
 Bundle 'kovisoft/paredit'
 Bundle 'typedclojure/vim-typedclojure'

 " Julia vim files
 Bundle 'JuliaLang/julia-vim'

 filetype plugin indent on

 " Backups and swap
 set nobackup
 set nowritebackup
 set noswapfile
 set backupdir=~/.vim/backup
 set directory=~/.vim/backup

 syntax on
 set nohidden
 set history=10000
 set number
 set ruler
 "set switchbuf=useopen
 set encoding=utf-8

 " Whitespace stuff
 set nowrap
 set list listchars=tab:\ \ ,trail:·

 " Searching
 set hlsearch
 set incsearch
 set ignorecase
 set expandtab
 set smartcase

 " Tab completion
 set wildmode=longest,list
 set wildmenu
 set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled,*.css,tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache,bundler_stubs,build,error_pages

 " Status bar
 set laststatus=2

 set background=dark
 color hybrid
 set guifont=Monaco:h13

 " Show (partial) command in the status line
 set showcmd

 set noerrorbells
 set visualbell
 set t_vb=

 " Use modeline overrides
 set modeline
 set modelines=10

 " Remember last location in file
 if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
     \| exe "normal g'\"" | endif
 endif

 " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
 au FileType * set softtabstop=2 tabstop=2 shiftwidth=2
 au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

 " allow backspacing over everything in insert mode
 set backspace=indent,eol,start

 " Inserts the path of the currently edited file into a command
 " Command mode: %%
 cmap %% <C-R>=expand("%:p:h") . "/" <CR>

 " Enable syntastic syntax checking
 "let g:syntastic_enable_signs=1
" let g:syntastic_quiet_warnings=1

 " Turn off jslint errors by default
 let g:JSLintHighlightErrorLine = 0

 " Use Node.js for JavaScript interpretation
 let $JS_CMD='node'

 " MacVIM shift+arrow-keys behavior (required in .vimrc)
 let macvim_hig_shift_movement = 1

 "map quick quit
 map <leader>qq :qa!<cr>

 "key mapping for window navigation
 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l

 " Make the window we're on as big as it makes sense to make it
 set winwidth=90

 " We have to have a winheight bigger than we want to set winminheight. But
 " if we set winheight to be huge before winminheight, the winminheight set
 " will fail.
 " set winheight=5
 " set winminheight=5
 " set winheight=999

 " don't delay when you hit esc in terminal vim, this may make arrow keys not
 " work well when ssh'd in
 set ttimeoutlen=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <Left> :echo "no!"<cr>
 map <Right> :echo "no!"<cr>
 map <Up> :echo "no!"<cr>
 map <Down> :echo "no!"<cr>

 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Vroom
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:vroom_map_keys = 0
 let g:vroom_write_all = 1
 let g:vroom_use_bundle_exec = 0
 map <leader>tt :VroomRunTestFile<cr>
 map <leader>T :VroomRunNearestTest<cr>

 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " " Airline
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#branch#enabled = 1

 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " CtrlP mappings
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Don't manage working directory
 let g:ctrlp_working_path_mode = 0
 let g:ctrlp_open_new_file = 'r'
 map <leader>bf :CtrlPBuffer<cr>
 map <leader>mr :CtrlPMRU<cr>

 map <leader>f :let g:ctrlp_default_input = 0<cr>:CtrlP<cr>
 map <leader>u :let g:ctrlp_default_input = 0<cr>:CtrlPBuffer<cr>
 map <leader><leader>f :let g:ctrlp_default_input = 0<cr>:CtrlPClearCache<cr>:CtrlP<cr>
 let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Python mode configuration
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Disable python folding
 let g:pymode_folding = 0

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " NerdTree configuration
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <leader>nt :NERDTree<CR>

" Quickly edit/reload the vimrc file
 nmap <silent> <leader>ev :e $MYVIMRC<CR>
 nmap <silent> <leader>sv :so $MYVIMRC<CR>


" automatically close preview window on exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" remove toolbar
set guioptions-=T

" 80-column line
set colorcolumn=121
highlight! link ColorColumn CursorColumn

" Smarter split opening
set splitbelow
set splitright

" Trim trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" autocomplete configuration
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" go settings
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
autocmd FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
au FileType go au BufWritePre <buffer> Fmt
au BufWritePost *.go silent! !ctags -f $GOPATH/tags -R &
nmap <leader>r :!tmux send-keys -t 2 C-c <cr> :call Send_to_Tmux("clear; go run ".expand("%")."\n") <cr>
nmap <Leader>t :!tmux send-keys -t 2 C-c <cr> :call Send_to_Tmux("clear; go test -cover ./...\n") <cr>
nmap <Leader>i :!tmux send-keys -t 2 C-c <cr> :call Send_to_Tmux("clear; go install\n") <cr>
nmap <Leader>b :!tmux send-keys -t 2 C-c <cr> :call Send_to_Tmux("clear; go build ./...\n") <cr>
nmap <Leader>d :Godoc <cr>

" clojure settings
