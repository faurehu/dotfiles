" VimPlug plugin manager
" Call :PlugInstall to run
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
Plug 'Valloric/YouCompleteMe'
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'sebdah/vim-delve'
Plug 'jiangmiao/auto-pairs'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vimwiki/vimwiki'
Plug 'arcticicestudio/nord-vim'
call plug#end()

" Enable syntax highlighting
syntax on

" Recognize filetypes, indent and load plugins accordingly
filetype plugin indent on

" Set Omni-completion
set nocompatible

" Set color
colorscheme gotham256
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_comment_brightness = 12
let g:nord_cursor_line_number_background = 1
" colorscheme nord

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
" Turned it off to be able to use urxvt+tmux+vim clipboard
" set mouse=a

" Set command window height to 2 lines
set cmdheight=1

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
let g:syntastic_auto_jump = 3
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_loc_list_height = 4
let g:syntastic_ruby_checkers = ['rubocop']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tslint']

" Typescriptsupport
au BufRead,BufNewFile *.tsx set ft=typescript

" clear higlights
nnoremap <silent> <C-c> :noh<cr>

" Airline
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" CtrlP
set runtimepath^=~/.config/nvim/plugged/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Closing error windows before creating new windows
autocmd WinEnter * if winnr('$') > 1|lclose|endif

" Terminal
tnoremap <Esc> <C-\><C-n>
autocmd BufWinEnter,WinEnter term://* startinsert

" Neoterm
let g:neoterm_default_mod = 'rightbelow'
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>
" open terminal
nnoremap <silent> <leader>t :Ttoggle<cr><C-w>j
" hide/close terminal
nnoremap <silent> <leader>h :Tclose<cr>
" clear terminal
nnoremap <silent> <leader>l :Tclear<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>k :Tkill<cr>

" YouCompleteMe
let g:ycm_python_binary_path = 'usr/bin/python'
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Quickfix tools (taken from vim-go tutorial)
" let g:go_list_type = \"quickfix"
" map <C-k> :cnext<CR>
" map <C-m> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>

" vim-go tutorial suggestions
" set autowrite " Writes content of file when calling ':make'
" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
" let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" let g:go_metalinter_autosave = 1

" ZoomWin replacement
map <silent> <leader>f :tab split<cr>

" Toggle tmux status line off
autocmd VimEnter,VimLeave * silent !tmux set status

" Auto loaded (no idea by who)
let g:python_host_prog = '/usr/bin/python'

" Vimwiki
:map >> <Plug>VimwikiIncreaseLvlSingleItem
:map >>> <Plug>VimwikiIncreaseLvlWholeItem

" ctrl-p ignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = 'ra'
