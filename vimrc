" Vundler header
" ==============

" Drop vi compatibility
set nocompatible

" Vundle: required
filetype off

" Vundle: set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugins
" =======

" Vundle: required
Plugin 'gmarik/Vundle.vim'

" File explorer (,e)
Plugin 'scrooloose/nerdtree'

" Make NERDTree more awesome
Plugin 'jistr/vim-nerdtree-tabs'

" HTML5 syntax
Plugin 'othree/html5.vim'

" Fuzzy file finder (,o)
Plugin 'kien/ctrlp.vim'

" Dash integration - TODO: This should only be installed under OSX
Plugin 'rizzatti/dash.vim'

" Swift lang support
Plugin 'toyamarinyon/vim-swift'

" Tmux & vim integration
Bundle 'christoomey/vim-tmux-navigator'

" Toogle commments plugin
Bundle 'tomtom/tcomment_vim'

" You Complete Me
Bundle 'Valloric/YouCompleteMe'

" Golang integration
Bundle 'fatih/vim-go'

" Airline
Plugin 'bling/vim-airline'

" Makes vim + tmux + iterm2 work better together
Plugin 'sjl/vitality.vim'

" Vundler footer
" ==============

" Vundle: required
call vundle#end()

" Vundle: required
filetype plugin indent on

" General configuration
" =====================

" Use utf8
set encoding=utf-8

" Automatically read a file when it is changed from the outside
set autoread

" Don't redraw while executing macros
set lazyredraw

" Entries of the commands history
set history=1000

" Prevent some security exploits
set modelines=0

" Disable the bell
set vb t_vb=

" Update after 1 second of no activity (check for external file change, etc.)
set updatetime=1000

" Don't bother with swap files
set noswapfile

" Keep a persistent undo backup file
if has('persistent_undo')
    set undofile undodir=~/.vim/.undo//,~/tmp//,/tmp//
endif

" Ctags index directories
set tags=.git/tags;$HOME,.svn/tags;$HOME,tags;$HOME

" Input configuration
" ===================

" Enable auto indenting on new lines (and be smart on newlines)
set autoindent smartindent copyindent

" Use spaces instead of tabs (and be smart on newlines)
set expandtab smarttab

" Tab equals 4 spaces
set shiftwidth=4 softtabstop=4 tabstop=4

" Enable mouse support in console
set mouse=a

" Make backspace work normally
set backspace=2

" Line wrapping motions
set whichwrap+=h,l

" When at 3 spaces, and hit > ... go to 4, not 7
set shiftround

" Use system clipboard as default register
set clipboard=unnamed,unnamedplus

" Instead of failing after a missing !, ask what to do
set confirm

" Style config
" ============

" Enable syntax highlighting
syntax enable

" Show line numbers
set number

" Show status line
set laststatus=2

" Show the ruler
set ruler

" Show incomplete commands while you are typing them
set showcmd

" Have 5 lines ahead of the cursor in screen whenever possible
set scrolloff=5

" Try to change the terminal title
set icon title

" Console Vim: Force 256 colors
set t_Co=256

" Don't try to highlight lines longer than 500 characters
set synmaxcol=500

" Color the column 80
set colorcolumn=81
hi ColorColumn cterm=none ctermbg=237

" Highlight current line by default
set cursorline
hi CursorLine cterm=none ctermbg=235

" Auto commands
" =============

" Wrap all the following autocmds in an augroup
augroup vimrc
autocmd!

" Remove any trailing whitespace
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Restore cursor position to where it was before closing
autocmd BufReadPost * if &ft != 'gitcommit' | silent! execute 'normal! g`"' | endif

" Check for file changes after 'updatetime' milliseconds of cursor hold
autocmd CursorHold * silent! checktime

" Highlight current line only on selected window
autocmd WinEnter,BufEnter,FocusGained * set cursorline
autocmd WinLeave,BufLeave,FocusLost * set nocursorline

" Filetype commands
" =================

" Ruby filetype detection
autocmd BufRead,BufNewFile Gemfile,Capfile,config.ru setfiletype ruby

" Markdown filetype detection
autocmd BufRead,BufNewFile *.md setfiletype markdown

" Json filetype detection
autocmd BufRead,BufNewFile *.json setfiletype javascript

" Use 2 spaces for indent in ruby, and allow ! and ? in keywords
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 iskeyword+=!,?

" Use tabs in makefiles
autocmd FileType make setlocal noexpandtab

" Spell check in commits
autocmd FileType gitcommit setlocal spell

" Column at line 80 in python because 79 is the limit
autocmd FileType python setlocal colorcolumn=80

" Column at line 121 in go because 120 is the limit i'm currently using
autocmd FileType go setlocal colorcolumn=121

" All autocmds should be before this
augroup END

" Complete and search config
" ==========================

" Command line completion stuff
set wildmenu
set wildmode=list:longest,full
set wildignore=.svn,.git,*.o,*~,*.swp,*.pyc,*.class,*.dSYM

" Tab completion stuff
set completeopt=longest,menuone

" Ignore case when searching
set ignorecase

" Unless upper case is used
set smartcase

" Use incremental searching (search while typing)
set incsearch

" Highlight things that we find with the search
set hlsearch

" Key mappings
" ============

" Map ,, to ,
nnoremap ,, ,

" Map leader key to ,
let mapleader = ","

" Map backspace key to dismiss search highlighting
nnoremap <silent> <BS> :nohlsearch<CR>

" Remap jj to escape in insert mode
inoremap jj <Esc>

" Disable arrows
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Move to and from tag definition with Ctrl-Shift-{Right,Left}
nnoremap <silent> <C-S-Right> g<C-]>
nnoremap <silent> <C-S-Left> <C-T>

" Map remove line without yanking it to Ctrl-d
nnoremap <silent> <C-d> "_dd

" NERDTree
" ========

" Toggle the file [e]xplorer
nnoremap <silent> <Leader>e :NERDTreeTabsToggle<CR>

" Open NerdTreeTabs and focus on the file
let g:nerdtree_tabs_open_on_console_startup = 1
let g:nerdtree_tabs_smart_startup_focus = 2

" CtrlP
" =====

" CtrlP plugin configuration
let g:ctrlp_map = '<Leader>o'
let g:ctrlp_max_height = 15
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_clear_cache_on_exit = 0

nnoremap <silent> <Leader>t :CtrlPTag<CR>

" Dash - TODO: This should only be done under OSX
" ====

" Map Dash search to ,h
nmap <silent> <leader>h <Plug>DashSearch

" Airline
" =======

let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" Vim tmux navigator
" ==================
inoremap <silent> <c-h> <Esc>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j> <Esc>:TmuxNavigateDown<cr>
inoremap <silent> <c-k> <Esc>:TmuxNavigateUp<cr>
inoremap <silent> <c-l> <Esc>:TmuxNavigateRight<cr>
