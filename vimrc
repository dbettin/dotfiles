 set nocompatible
 let mapleader = ","
 filetype off

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'L9'

 " tree based navigation
 Bundle 'scrooloose/nerdtree'

 " Git in vim, use ,gs for git status then - to stage then C to commit
 " check :help Gstatus for more keys
 Bundle 'tpope/vim-fugitive'

 " Comment with gc (takes a motion) or ^_^_
 Bundle 'tomtom/tcomment_vim'

 " Automatically add end at the end of ruby and vim blocks
 Bundle 'tpope/vim-endwise'

 " Surrond stuff with things. ysiw" surrounds a word with quotes cs"' changes " to '
 Bundle 'tpope/vim-surround'

 " Handy file manipulations. Favorites are :Remove and :Rename
 Bundle 'tpope/vim-eunuch'

 " Shows syntax errors on several types of files
 Bundle 'scrooloose/syntastic'

 " Run specs or cucumber features with ,t run only the test under the cursor
 " with ,T also remembers last run test so you can hit it again on non-test
 " files to run the last run test
 Bundle 'skalnik/vim-vroom'

 " Vim coffeescript runtime files
 Bundle 'kchmck/vim-coffee-script'

 " Vim typescript runtime files
 Bundle 'leafgarland/typescript-vim'

 " Updated ruby syntax and such
 Bundle 'vim-ruby/vim-ruby'

 " Some syntax highlighthing for rails and :Rextract to extract partials
 Bundle 'tpope/vim-rails'

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

 " Manages vim sessions
 Bundle 'xolox/vim-session'

 "Add a few paired mappings, in particular [q and ]q to navigate the quickfix list
 Bundle 'tpope/vim-unimpaired'

 " Add python mode support for pep8, pylint, and pydoc
 Bundle 'klen/python-mode'

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
 set switchbuf=useopen
 set encoding=utf-8

 " Whitespace stuff
 set nowrap
 set tabstop=2
 set shiftwidth=2
 set softtabstop=2
 set expandtab
 set list listchars=tab:\ \ ,trail:·

 " Searching
 set hlsearch
 set incsearch
 set ignorecase
 set smartcase

 " Tab completion
 set wildmode=longest,list
 set wildmenu
 set wildignore+=*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*,public/javascripts/compiled,*.css,tmp,*.orig,*.jpg,*.png,*.gif,log,solr,.sass-cache,.jhw-cache,bundler_stubs,build,error_pages

 " Status bar
 set laststatus=2

 color codeschool
 set guifont=Inconsolata\ Bold\ 12

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

 " make uses real tabs
 au FileType * set expandtab
 au FileType make set noexpandtab

 au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
 au BufNewFile,BufRead *.json set ft=javascript
 au BufNewFile,BufRead *.hamlbars set ft=haml
 au BufNewFile,BufRead *.hamlc set ft=haml
 au BufNewFile,BufRead *.jst.ejs set ft=jst

 au FileType * set softtabstop=2 tabstop=2 shiftwidth=2

 " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
 au FileType python set softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

 " allow backspacing over everything in insert mode
 set backspace=indent,eol,start

 " Inserts the path of the currently edited file into a command
 " Command mode: %%
 cmap %% <C-R>=expand("%:p:h") . "/" <CR>

 " Enable syntastic syntax checking
 let g:syntastic_enable_signs=1
 let g:syntastic_quiet_warnings=1

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
 set winheight=5
 set winminheight=5
 set winheight=999

 set lines=60 columns=110

 " don't delay when you hit esc in terminal vim, this may make arrow keys not
 " work well when ssh'd in
 set ttimeoutlen=5

 " Enable syntastic syntax checking
 let g:syntastic_enable_signs=1
 let g:syntastic_quiet_warnings=1

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
 map <leader>t :VroomRunTestFile<cr>
 map <leader>T :VroomRunNearestTest<cr>

 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " " Copy paste system clipboard
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 map <leader>y "*y
 map <leader>p "*p
 map <leader>P "*P

 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " " Fugitive
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  map <leader>gs :Gstatus<cr>
  map <leader>gc :Gcommit<cr>
  map <leader>ga :Git add --all<cr>:Gcommit<cr>
  map <leader>gb :Gblame<cr>

  " Use j/k in status
  function! BufReadIndex()
    setlocal cursorline
    setlocal nohlsearch

    nnoremap <buffer> <silent> j :call search('^#\t.*','W')<Bar>.<CR>
    nnoremap <buffer> <silent> k :call search('^#\t.*','Wbe')<Bar>.<CR>
  endfunction

  autocmd BufReadCmd  *.git/index                      exe BufReadIndex()
  autocmd BufEnter    *.git/index                      silent normal gg0j

  " Start in insert mode for commit
  function! BufEnterCommit()
    normal gg0
    if getline('.') == ''
      start
    end
  endfunction
  autocmd BufEnter    *.git/COMMIT_EDITMSG             exe BufEnterCommit()

  " Automatically remove fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

 """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " CtrlP mappings
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Don't manage working directory
 let g:ctrlp_working_path_mode = 0

 map <leader>jv :let g:ctrlp_default_input = 'app/views/'<cr>:CtrlP<cr>
 map <leader>jc :let g:ctrlp_default_input = 'app/controllers/'<cr>:CtrlP<cr>
 map <leader>jm :let g:ctrlp_default_input = 'app/models/'<cr>:CtrlP<cr>
 map <leader>jh :let g:ctrlp_default_input = 'app/helpers/'<cr>:CtrlP<cr>
 map <leader>jl :let g:ctrlp_default_input = 'lib'<cr>:CtrlP<cr>
 map <leader>jp :let g:ctrlp_default_input = 'public'<cr>:CtrlP<cr>
 map <leader>js :let g:ctrlp_default_input = 'app/stylesheets/'<cr>:CtrlP<cr>
 map <leader>jj :let g:ctrlp_default_input = 'app/javascripts/'<cr>:CtrlP<cr>
 map <leader>jf :let g:ctrlp_default_input = 'features/'<cr>:CtrlP<cr>
 map <leader>f :let g:ctrlp_default_input = 0<cr>:CtrlP<cr>
 map <leader>u :let g:ctrlp_default_input = 0<cr>:CtrlPBuffer<cr>
 map <leader><leader>f :let g:ctrlp_default_input = 0<cr>:CtrlPClearCache<cr>:CtrlP<cr>

 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " Quit help easily
 " """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 function! QuitWithQ()
   if &buftype == 'help'
        nnoremap <buffer> <silent> q :q<cr>
   endif
 endfunction
 autocmd FileType help exe QuitWithQ()

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

" CTags
 map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
 map <C-\> :tnext<CR>

" Go to Previous File
 map <Leader>p <C-^>

" show quickfix when errors happen
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" automatically close preview window on exiting insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" remove toolbar
set guioptions-=T
