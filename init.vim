" Pathogen plugin manager
" execute pathogen#infect()

" VimPlug plugin manager
call plug#begin('~/.config/nvim/plugged')
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kassio/neoterm'
Plug 'jceb/vim-orgmode'
call plug#end()

" Enable syntax highlighting
syntax on

" Recognize filetypes, indent and load plugins accordingly
filetype plugin indent on

" Set Omni-completion
set nocompatible

" Set color
colorscheme gotham256

" Map space as leader
let mapleader = "\<Space>"

" Better command-line completion
set wildmenu

" Highlight searches
set hlsearch

" Use case insensitive searches except when using capital letters
set ignorecase
set smartcase

" Keep the same indent as the line you're currently on
set autoindent

" Always display the the status line
set laststatus=2

" Instead of failing command because of unsaved files, instead ask if I want
" to save files
set confirm

" Enable use of mouse for all modes
set mouse=a

" Set command window height to 2 lines
set cmdheight=2

" Display line numbers
set number

" Fix backspace issue (won't delete line breaks)
set backspace=indent,eol,start

" Change column color
set colorcolumn=110

" Default indentation rules
" Expand tab makes tab key insert spaces
set expandtab
"set ts=2
set shiftwidth=2
set softtabstop=2
set ai
set si

" Map arrow keys to text shifting
nmap <Left> <<
nmap <Right> >>
vmap <Left> <gv
vmap <Right> >gv
nmap <Up> [e
nmap <Down> ]e
vmap <Up> [egv
vmap <Down> ]egv

" Splits
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s<C-w>j
nnoremap <leader>c <C-w>c
nnoremap <C-Left> <C-w>h
nnoremap <C-Right> <C-w>l
nnoremap <C-Up> <C-w>k
nnoremap <C-Down> <C-w>j

" Comments
nmap <C-_> gcc
vmap <C-_> gc

" Use real lines
map j gj
map k gk

" Autocomplete case sensitive
set infercase

" Strip whitespace on save
autocmd BufWritePre * StripWhitespace

" Grep
nnoremap <C-f> :grep<space>

" Instant searching
set incsearch

" Set path
set path=.,**

" Set numbers relative
set relativenumber

" Improve :grep
set grepprg=ack\ --nogroup\ --column\ $*
set grepformat=%f:%l:%c:%m

" Folding
set foldmethod=indent
set foldlevelstart=20

" Explorer
map <silent> <C-n> :NERDTreeToggle<CR>

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 4
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']

" ZoomWin mapping
nnoremap <silent> <leader>f :ZoomWin<CR>

" :find mapping
nnoremap <C-p> :find<space>

" Airline
let g:airline_skip_empty_sections = 1
let g:airline_theme='luna'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" CtrlP
set runtimepath^=~/.config/nvim/plugged/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Terminal
tnoremap <Esc> <C-\><C-n>
autocmd BufWinEnter,WinEnter term://* startinsert

" Closing error windows before creating new windows
autocmd WinEnter * if winnr('$') > 1|lclose|endif

" Neoterm
let g:neoterm_position = 'horizontal'
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>
" open terminal
nnoremap <silent> <leader>t :call neoterm#toggle()<cr><C-w>j
" hide/close terminal
nnoremap <silent> <leader>h :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> <leader>l :call neoterm#clear()<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>k :call neoterm#kill()<cr>

let g:python_host_prog = '/usr/bin/python'
