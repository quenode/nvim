

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
set t_Co=256

set t_Co=256
filetype off
filetype plugin on
syntax on

set rtp+=~/.config/nvim/autoload

call plug#begin('~/.config/nvim/autoload')



" Let Vundle manage Vundle
"Plug 'gmarik/vundle'



" My Bundles
"Plug 'tpope/vim-sensible'
" cs souround
"Plug 'tpope/vim-surround'
" git usage 
"Plug 'tpope/vim-fugitive'
"Color 
"Java Script plugins
" Snipeti auto deploy cool 
"Plug 'SirVer/ultisnips'
" duplo kao gore
"Plug 'honza/vim-snippets'
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'nanotech/jellybeans.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
" cool buffering CTRL+P
Plug 'kien/ctrlp.vim'
" Search silver brew install the_silver_searcher require to install searcher
Plug 'rking/ag.vim'
Plug 'kana/vim-textobj-user'
Plug 'slim-template/vim-slim'
Plug 'flazz/vim-colorschemes'
"Plug 'davidhalter/jedi-vim'
Plug 'nathanaelkane/vim-indent-guides'
"Bundle 'Valloric/YouCompleteMe'
Plug 'https://github.com/freeo/vim-kalisi'
Plug 'Lokaltog/vim-easymotion'
"Plug 'klen/python-mode'
Plug 'rizzatti/dash.vim'
Plug 'chase/vim-ansible-yaml'

Plug 'lepture/vim-jinja'

"Plug 'christoomey/vim-tmux-navigator'



call plug#end()
" deoplete testing 
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
"" Maps leader keys
" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern

"let g:deoplete#omni#functions.javascript = [
"\ 'tern#Complete',
"  \ 'jspc#omni'
"\]

if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
" Javascript LINT
let g:neomake_javascript_enabled_makers = ['eslint']

"autocmd BufWritePost,BufEnter * Neomake

"Maper
let mapleader = ","

"" Qucik save 
noremap <Leader>s :update<CR>
vnoremap <Leader>s :update<CR>
inoremap <Leader>s :update<CR>



set pastetoggle=<F2>
set clipboard=unnamed
let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0



let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" enable fonts for ar line
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"augroup vimrc_autocmds
"    autocmd!
"    " highlight characters past column 120
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%120v.*/
"    autocmd FileType python set nowrap
"    augroup END
"
filetype plugin indent on

let mapleader=","

"color jellybeans
colorscheme Monokai
"let g:jellybeans_use_term_italics = 1


"easy motion
"search map bad don'tlike it
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " High problematic char spaces
set list
set cursorline
set modelines=1
set autoindent
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
"set ttyscroll=10
set encoding=utf-8
set tabstop=4
set softtabstop=4
set expandtab
set wrap
set number
set expandtab
set mouse=a 
set bs=2 
set backup
set backupdir=~/.vim/tmp
set backupskip=/tmp/*
set directory=~/.vim/tmp
set writebackup

set hlsearch
set ignorecase
set smartcase

set incsearch
set cursorline
set showcmd
set wildmenu
set showmatch
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set laststatus=2

set encoding=utf-8
set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
set termencoding=utf-8

""set indents
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=38
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
"noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
  nmap Ä <C-W><<C-W><
  nmap Ö <C-W>><C-W>>
  nmap ö <C-W>-<C-W>-
  nmap ä <C-W>+<C-W>+
endif

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" Syntastic

" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5


let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" Go programming
set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim
" Quit with :Q
command -nargs=0 Quit :qa!
