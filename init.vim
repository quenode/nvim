

"New changes

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
set t_Co=256

set rtp+=~/.config/nvim/autoload

call plug#begin('~/.config/nvim/autoload')
"Color Boje
Plug 'flazz/vim-colorschemes'



" Sets setup for system




" The plugisng for neovim
" My Bundles
"Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
if has('nvim')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Autosave vim NEOVIM 
"
"
Plug 'vim-scripts/vim-auto-save'
"
let g:auto_save = 1  
let g:auto_save_in_insert_mode = 0 

" Deoplete Plugins
Plug 'kristijanhusak/deoplete-phpactor',  {'for': 'php'}
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx', 'vue'] }

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"" Neosnipet expansion

Plug 'Shougo/neosnippet.vim' " snippet manager
Plug 'Shougo/neosnippet-snippets'

" php refactoring options
Plug 'StanAngeloff/php.vim', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
Plug '2072/php-indenting-for-vim', {'for': 'php'}
" php doc autocompletion
Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" javascript plugins
Plug 'pangloss/vim-javascript'
" need to run npm install in the folder ~/nvim/plugged/tern_for_vim
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx', 'vue'], 'do': 'npm install'}
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx', 'vue'] }

Plug 'scrooloose/nerdcommenter'
Plug 'neomake/neomake'
" cool buffering CTRL+P
" This should be replaced
Plug 'mileszs/ack.vim'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }


" Remove less space plugin

"Plug 'thirtythreeforty/lessspace.vim'
" Search silver brew install the_silver_searcher require to install searcher
Plug 'flazz/vim-colorschemes'
" Poligota
Plug 'sheerun/vim-polyglot'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Lokaltog/vim-easymotion'
Plug 'lepture/vim-jinja'



Plug 'christoomey/vim-tmux-navigator'
" FZF setting ctrlp other

""Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()



""" Work Around for slow unamed clipboard
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus


"Maper
let mapleader = ","

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
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_template_syntaxes = { '*.j2': '.config.j2' }
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


" Deoplete enable
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
call deoplete#custom#option('sources', {
    \ '_': ['omni', 'around', 'buffer', 'tag', 'member', 'file', 'neosnippet'],
    \ 'php': ['phpactor', 'around', 'buffer', 'member', 'file', 'neosnippet']
    \})
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1



" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"inoremap <silent><expr><CR> pumvisible() ? deoplete#mappings#close_popup()."\<Plug>(neosnippet_expand_or_jump)" : "\<CR>"
let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1

" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
 let g:tern_show_signature_in_pum = 1
 autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"" Qucik save
noremap <Leader>s :update<CR>
vnoremap <Leader>s :update<CR>
inoremap <Leader>s :update<CR>



set pastetoggle=<F2>
"let g:pymode_rope = 0
" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

"Linting
"let g:pymode_lint = 1
"let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
"let g:pymode_lint_write = 1

" Support virtualenv
"let g:pymode_virtualenv = 1

" Enable breakpoints plugin
"let g:pymode_breakpoint = 1
"let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
"let g:pymode_syntax = 1
"let g:pymode_syntax_all = 1
"let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
"let g:pymode_folding = 0



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
"filetype plugin indent off


"color jellybeans
set background=dark
colorscheme Monokai
"let g:jellybeans_use_term_italics = 1


"easy motion
"search map bad don'tlike it
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

"set nocompatible
"filetype off
"filetype plugin indent on
"filetype plugin on


set showmatch
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set laststatus=2
set encoding=utf-8
"set t_Co=256
"set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
set termencoding=utf-8









"" Key mapings setup
let mapleader=","

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


