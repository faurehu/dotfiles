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
Plug 'tpope/vim-projectionist'
Plug 'kshenoy/vim-signature'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'junegunn/goyo.vim'
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

set incsearch
" Instant searching

" Set path
set path=.,**

" Set numbers relative
set relativenumber

" Folding
set foldmethod=indent
set foldlevelstart=20

" Highlight current line
set cursorline

" NerdTree
"https://stackoverflow.com/questions/33465357/one-mapping-to-toggle-nerdtree-and-open-to-current-file-when-toggling-on
nnoremap <silent> <expr> <C-n> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

" Typescript support
autocmd BufRead,BufNewFile *.tsx set ft=typescript
let g:nvim_typescript#diagnostics_enable = 0
let g:typescript_compiler_options = "--lib esnext --lib dom --jsx react"

" clear highlights
nnoremap <silent> <C-c> :noh<cr>

" Airline
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline_section_b=''
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#exclude_preview = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_splits = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

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
let g:ale_fixers = {'typescript': ['prettier', 'tslint']}
let g:ale_fix_on_save = 1
let g:ale_list_window_size = 5
let g:ale_lint_on_enter = 1

" fzf
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-h> :History<CR>
nnoremap <C-f> :Ag<CR>

command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'),<bang>0)

command! -bang -nargs=* GFiles
\ call fzf#vim#gitfiles(<q-args>,fzf#vim#with_preview('right:50%'),<bang>0)

" Projectionist
nnoremap <leader>a :AV<CR>

" Show buffer list
" nnoremap <leader>\ :ls<CR>:b<space>
nnoremap <leader>\ :bd<CR>

" Disable annoying ex mode
map q: <Nop>
nnoremap Q <nop>

" Newtab
nnoremap <leader>n :tabedit<CR>

" Clipboard copy
vnoremap <C-c> "+y

" coc.nvim
nnoremap <C-T> :CocList symbols<CR>
nnoremap <C-Y> :CocList yank<CR>
