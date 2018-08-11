

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
"Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
"Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
" cool buffering CTRL+P
" This should be replaced
Plug 'mileszs/ack.vim'
Plug 'pearofducks/ansible-vim'
" Remove less space plugin

Plug 'thirtythreeforty/lessspace.vim'
" Search silver brew install the_silver_searcher require to install searcher
Plug 'flazz/vim-colorschemes'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Lokaltog/vim-easymotion'
Plug 'chase/vim-ansible-yaml'
Plug 'lepture/vim-jinja'




Plug 'christoomey/vim-tmux-navigator'

" FZF setting ctrlp other

""Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.config/nvim/fuzzy-history'

let g:fzf_action = {
  \ 'enter': 'tab split',
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~50%' }


" ansible config options from plugin

let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_with_keywords_highlight = 'Constant'



"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }



" In Neovim, you can set up fzf window using a Vim command
if executable('fzf')

" This is the default extra key bindings
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


  " FZF {{{
  " <C-p> or <C-t> to search files
  nnoremap <silent> <C-t> :FZF -m<cr>
  nnoremap <silent> <C-p> :FZF -m<cr>

  " <M-p> for open buffers
  nnoremap <silent> <M-p> :Buffers<cr>

  nnoremap <Leader>d :Buffers<cr>

  " <M-S-p> for MRU
  nnoremap <silent> <M-S-p> :History<cr>

  " Use fuzzy completion relative filepaths across directory
  imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

  " Better command history with q:
  command! CmdHist call fzf#vim#command_history({'right': '60'})
  nnoremap q: :CmdHist<CR>

  " Better search history
  command! QHist call fzf#vim#search_history({'right': '60'})
  nnoremap q/ :QHist<CR>

  command! -bang -nargs=* Ack call fzf#vim#ag(<q-args>, {'down': '80%', 'options': --no-color'})
  " }}}
else
  " CtrlP fallback
end

call plug#end()

" deoplete testing

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"let g:deoplete#enable_at_startup = 1
"if !exists('g:deoplete#omni#input_patterns')
"  let g:deoplete#omni#input_patterns = {}
"endif
" let g:deoplete#disable_auto_complete = 1
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
"autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>
"" Maps leader keys
" omnifuncs
"augroup omnifuncs
"  autocmd!
"  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"augroup end
" tern

"let g:deoplete#omni#functions.javascript = [
"\ 'tern#Complete',
"  \ 'jspc#omni'
"\]

"if exists('g:plugs["tern_for_vim"]')
"  let g:tern_show_argument_hints = 'on_hold'
"  let g:tern_show_signature_in_pum = 1
"  autocmd FileType javascript setlocal omnifunc=tern#Complete
"endif
" Javascript LINT
"let g:neomake_javascript_enabled_makers = ['eslint']

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
let g:airline#extensions#tabline#enabled = 0
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

"augroup vimrc_autocmds
"    autocmd!
"    " highlight characters past column 120
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%120v.*/
"    autocmd FileType python set nowrap
"    augroup END
"
filetype plugin indent off

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
"let g:indent_guides_start_level = 2
"let g:indent_guides_guide_size = 1
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
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

nmap <leader>f :GitFiles<cr>
nmap <leader>b :buffers<cr>

" Tab between buffers
"noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>


nnoremap <leader>q  :q<cr>

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
"nnoremap <silent> t :CtrlP<cr>
"let g:ctrlp_working_path_mode = 1
"let g:ctrlp_by_filename = 1
"let g:ctrlp_max_files = 0
"let g:ctrlp_max_depth = 100


"let g:ctrlp_prompt_mappings = {
"    \ 'AcceptSelection("e")': ['<c-t>'],
"    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
"    \ }
"
" Go programming
"set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim
set rtp+=/usr/local/opt/fzf

" Quit with :Q
command -nargs=0 Quit :qa!
