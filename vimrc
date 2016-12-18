 set nocompatible
 let mapleader = ","
 filetype off

 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " required!
 Plugin 'VundleVim/Vundle.vim'

 " tmux integration
 Plugin 'christoomey/vim-tmux-navigator'

 " send to tmux pane
 Plugin 'xaviershay/tslime.vim'

 " original repos on github
 Plugin 'L9'

 " super tab for autocompletion
 Plugin 'ervandew/supertab'

 " tree based navigation
 Plugin 'scrooloose/nerdtree'

 " commenting helpers
 Plugin 'scrooloose/nerdcommenter'

 " Surround stuff with things. ysiw" surrounds a word with quotes cs"' changes " to '
 Plugin 'tpope/vim-surround'

 " Shows syntax errors on several types of files
 Plugin 'scrooloose/syntastic'

 " Open a file (like cmd-t but better). Use ,f or ,j(something, see bindings below)
 Plugin 'kien/ctrlp.vim'

 " Adds :Ack complete w/ quick fix
 Plugin 'mileszs/ack.vim'

 " Makes css colors show up as their actual colors, works better with CSApprox or macvim
 Plugin 'ap/vim-css-color'

 " Codeschool theme port
 Plugin '29decibel/codeschool-vim-theme'

 " Hybrid theme port
 Plugin 'w0ng/vim-hybrid'

 " Vim statusline/tabline that is light as air
 Plugin 'bling/vim-airline'

 " Ag searches text in files
 " Note: dependency on 'the_silver_searcher' to install on Mac
 " brew install the_silver_searcher
 Plugin 'rking/ag.vim'

 call vundle#end()

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
