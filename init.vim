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
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kassio/neoterm'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'sebdah/vim-delve'
Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ianks/vim-tsx', {'for': 'typescript.tsx'}
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'Valloric/ListToggle'
Plug 'chaoren/vim-wordmotion'
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

" Instant searching
set incsearch

" Set path
set path=.,**

" Set numbers relative
set relativenumber

" Folding
set foldmethod=indent
set foldlevelstart=20

" Explorer
map <silent> <C-n> :NERDTreeToggle<CR>

" Typescript support
autocmd BufRead,BufNewFile *.tsx set ft=typescript
let g:nvim_typescript#diagnostics_enable = 0

" clear highlights
nnoremap <silent> <C-c> :noh<cr>

" Airline
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'

" Closing error windows before creating new windows
autocmd WinEnter * if winnr('$') > 1|lclose|endif

" Neoterm
tnoremap <Esc> <C-\><C-n>
let g:neoterm_autojump = 1
let g:neoterm_default_mod = 'rightbelow'
nnoremap <silent> <f10> :TREPLSendFile<cr>
nnoremap <silent> <f9> :TREPLSendLine<cr>
vnoremap <silent> <f9> :TREPLSendSelection<cr>
" open terminal
nnoremap <silent> <leader>t :Ttoggle<cr><C-w>j
" hide/close terminal
nnoremap <silent> <leader>h :Tclose<cr>
" clear terminal
" nnoremap <silent> <leader>l :Tclear<cr>
" kills the current job (send a <c-c>)
nnoremap <silent> <leader>k :Tkill<cr>

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

" Ale
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_fixers = {'typescript': ['prettier', 'eslint']}
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_list_window_size = 5
" let g:ale_open_list = 1
let g:ale_lint_on_enter = 1

" Enable deoplete at startup
let g:deoplete#enable_at_startup = 1

" fzf
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-h> :History<CR>
nnoremap <C-f> :Ag<CR>

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,fzf#vim#with_preview('right:50%'),<bang>0)

command! -bang -nargs=* GFiles
  \ call fzf#vim#gitfiles(<q-args>,fzf#vim#with_preview('right:50%'),<bang>0)
