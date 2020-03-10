

"New changes

if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
end
set t_Co=256

set rtp+=~/.config/nvim/autoload

call plug#begin('~/.config/nvim/autoload')
"Color Boje
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-commentary'

""" TERN
Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

   
" Sets setup for system
Plug 'mkitt/tabline.vim'

"Plug 'phenomenes/ansible-snippets'

" The plugisng for neovim
" My Bundles
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
Plug '907th/vim-auto-save'



"Plug 'rizzatti/dash.vim'
"
let g:auto_save = 1

let g:auto_save_events = ["InsertLeave", "TextChanged", "CursorHold 50",]

"let g:auto_save_in_insert_mode = 0

" Deoplete Plugins

"Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

"" Neosnipet expansion

"Plug 'Shougo/neosnippet.vim' " snippet manager
"Plug 'Shougo/neosnippet-snippets'

" php refactoring options
" Plug 'StanAngeloff/php.vim', {'for': 'php'}
" Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}
" Plug 'nishigori/vim-php-dictionary', {'for': 'php'}
" Plug 'adoy/vim-php-refactoring-toolbox', {'for': 'php'}
" Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
" Plug '2072/php-indenting-for-vim', {'for': 'php'}
" php doc autocompletion
" Plug 'tobyS/vmustache' | Plug 'tobyS/pdv', {'for': 'php'}

" javascript plugins
" Plug 'pangloss/vim-javascript'
" need to run npm install in the folder ~/nvim/plugged/tern_for_vim
" Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx', 'vue'], 'do': 'npm install'}
" Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx', 'vue'] }

" Plug 'scrooloose/nerdcommenter'


"Plug 'neomake/neomake'
" cool buffering CTRL+P
" This should be replaced

Plug 'mileszs/ack.vim'

Plug 'dense-analysis/ale'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

"Auto Forma on save
Plug 'Chiel92/vim-autoformat'



" Teraform 
Plug 'hashivim/vim-terraform'
"Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'

" Remove less space plugin

Plug 'thirtythreeforty/lessspace.vim'
" Search silver brew install the_silver_searcher require to install searcher
" Poligota
"Plug 'sheerun/vim-polyglot'
"Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Lokaltog/vim-easymotion'



Plug 'christoomey/vim-tmux-navigator'

""YANK TMUX

Plug 'roxma/vim-tmux-clipboard'

" FZF setting ctrlp other

"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'



" post install (yarn install | npm install) then load plugin only for editing supported files


Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

" EOF PLUGS 
call plug#end()


" Map Leader to comma
let mapleader = ","





""" Teraform config

" Syntastic Config
"set statusline+=%#warningmsg#
"junegunn/fzf.vimset statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
"set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

""" Work Around for slow unamed clipboard
if has('macunix')
let g:clipboard = {'copy': {'+': 'pbcopy', '*': 'pbcopy'}, 'paste': {'+': 'pbpaste', '*': 'pbpaste'}, 'name': 'pbcopy', 'cache_enabled': 0}
set clipboard+=unnamedplus
endif

if has('unix')
set rtp+=~/.fzf
endif


" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.

if has('nvim') || has('gui_running')
	let $FZF_DEFAULT_OPTS .= ' --inline-info'
endif

command! -nargs=? -complete=dir AF
			\ call fzf#run(fzf#wrap(fzf#vim#with_preview({
			\   'source': 'fd --type f --hidden --follow --exclude .git --no-ignore . '.expand(<q-args>)
			\ })))


let g:fzf_history_dir = '~/.config/nvim/fuzzy-history'

" let g:fzf_action = {
"   \ 'enter': 'e ',
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
"let g:fzf_layout = { 'up': '~80%' }

let g:fzf_colors =
			\ { 'fg':      ['fg', 'Normal'],
			\ 'bg':      ['bg', 'Normal'],
			\ 'hl':      ['fg', 'Comment'],
			\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
			\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
			\ 'hl+':     ['fg', 'Statement'],
			\ 'info':    ['fg', 'PreProc'],
			\ 'border':  ['fg', 'Ignore'],
			\ 'prompt':  ['fg', 'Conditional'],
			\ 'pointer': ['fg', 'Exception'],
			\ 'marker':  ['fg', 'Keyword'],
			\ 'spinner': ['fg', 'Label'],
			\ 'header':  ['fg', 'Comment'] }

" Terminal buffer options for fzf
autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

if has('nvim')
	function! s:create_float(hl, opts)
		let buf = nvim_create_buf(v:false, v:true)
		let opts = extend({'relative': 'editor', 'style': 'minimal'}, a:opts)
		let win = nvim_open_win(buf, v:true, opts)
		call setwinvar(win, '&winhighlight', 'NormalFloat:'.a:hl)
		call setwinvar(win, '&colorcolumn', '')
		return buf
	endfunction

	function! FloatingFZF()
		" Size and position
		let width = float2nr(&columns * 0.9)
		let height = float2nr(&lines * 0.6)
		let row = float2nr((&lines - height) / 2)
		let col = float2nr((&columns - width) / 2)

		" Border
		let top = '╭' . repeat('─', width - 2) . '╮'
		let mid = '│' . repeat(' ', width - 2) . '│'
		let bot = '╰' . repeat('─', width - 2) . '╯'
		let border = [top] + repeat([mid], height - 2) + [bot]

		" Draw frame
		let s:frame = s:create_float('Comment', {'row': row, 'col': col, 'width': width, 'height': height})
		call nvim_buf_set_lines(s:frame, 0, -1, v:true, border)

		" Draw viewport
		call s:create_float('Normal', {'row': row + 1, 'col': col + 2, 'width': width - 4, 'height': height - 2})
		autocmd BufWipeout <buffer> execute 'bwipeout' s:frame
	endfunction

	let g:fzf_layout = { 'window': 'call FloatingFZF()' }
endif




"

"let g:fzf_layout = { 'window': 'enew' }
"let g:fzf_layout = { 'window': '-tabnew' }
"let g:fzf_layout = { 'window': '10split enew' }



" In Neovim, you can set up fzf window using a Vim command
"if executable('fzf')

" This is the default extra key bindings
" Customize fzf colors to match your color scheme
" let g:fzf_colors =
" \ { 'fg':      ['fg', 'Normal'],
"   \ 'bg':      ['bg', 'Normal'],
"   \ 'hl':      ['fg', 'Comment'],
"   \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"   \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"   \ 'hl+':     ['fg', 'Statement'],
"   \ 'info':    ['fg', 'PreProc'],
"   \ 'prompt':  ['fg', 'Conditional'],
"   \ 'spinner': ['fg', 'Label'],
"   \ 'header':  ['fg', 'Comment'] }


" FZF {{{
" <C-p> or <C-t> to search files
nnoremap <silent> <C-t> :History <cr>
nnoremap <silent> <C-p> :FZF -m<cr>

" <M-p> for open junegunn/fzf.vimbuffers
" nnoremap <M-e> :Buffers <cr>
"nnoremap <M-E> :History <cr>

nnoremap <Leader>d :Buffers<cr>
nnoremap <Leader>b :Buffers<cr>

" <M-S-p> for MRU
"nnoremap <silent> <M-S-p> :History<cr>

" Use fuzzy completion relative filepaths across directory
imap <expr> <c-x><c-f> fzf#vim#complete#path('git ls-files $(git rev-parse --show-toplevel)')

" Better command history with q:
command! CmdHist call fzf#vim#command_history({'right': '60'})
nnoremap q: :CmdHist<CR>

" Better search history
command! QHist call fzf#vim#search_history({'right': '60'})
nnoremap q/ :QHist<CR>


" ansible config options from plugin

let g:ansible_unindent_after_newline = 3
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_template_syntaxes = { '*.j2': '.config.j2' }
let g:ansible_with_keywords_highlight = 'Constant'
"

"
"
"
"" Fix files with prettier, and then ESLint.
"let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
"let b:ale_fixers = {'javascript': ['prettier', 'eslint']}

let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_format = '%s'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_enabled = 1
let g:ale_fix_on_save = 0
"let g:ale_fixers = {}

let g:ale_fixers = {
			\   'javascript': ['prettier'],
			\   'html': ['prettier'],
			\   'css': ['prettier'],
			\   'yaml': ['prettier'],
			\   'yaml.ansible': ['prettier'],
			\   'python': ['autopep8','yapf'],
			\}


"let g:ale_linters = ['flake8', 'pylint']
let g:ale_linters = {'python': ['flake8']}
"let g:ale_linters = ['flake8']
" Fix Python files with autopep8 and yapf.
"let g:ale_fixers = ['autopep8', 'yapf']
" Disable warnings about trailing whitespace for Python files.
let g:ale_warn_about_trailing_whitespace = 0

let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 200
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'always'
"let g:ale_linter_aliases = {}
"let g:ale_linters = {'yaml': []}
let g:ale_open_list = 0
let g:ale_set_highlights = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_signs = 1
let g:ale_sign_column_always = 0
let g:ale_sign_error = '✗'
let g:ale_sign_offset = 1000000
let g:ale_sign_warning = '▲'
let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
let g:ale_warn_about_trailing_whitespace = 1


"" Patyhon set tab
set expandtab
set tabstop=4
set shiftwidth=4


" deoplete testing


" Deoplete enable
let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
call deoplete#custom#option('sources', {
			\ '_': ['ale', 'omni', 'around', 'buffer', 'tag', 'member', 'file' ],
			\ 'php': ['ale', 'phpactor', 'around', 'buffer', 'member', 'file', ],
			\ 'javascript': ['ale', 'tern', 'around', 'buffer', 'member', 'file']
			\})
let g:deoplete#enable_smart_case = 1
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#auto_complete_delay = 3


set completeopt=longest,menuone,preview


" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1

" tern
"if exists('g:plugs["tern_for_vim"]')
"let g:tern_show_argument_hints = 'on_hold'
"  let g:tern_show_signature_in_pum = 1
" autocmd FileType javascript setlocal omnifunc=tern#Complete
"endif

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

"" Quit File no save
noremap <Leader>q :q!<CR>

"" RunRG Grep
noremap <Leader>rg :Rg<CR>


noremap <F3> :Autoformat<CR>
autocmd FileType python nnoremap <Leader>p :Autoformat<CR>
"noremap <Leader>p :Autoformat<CR>
set pastetoggle=<F2>
"let g:pymode_rope = 0
" Documentation
"let g:pymode_doc = 1
"let g:pymode_doc_key = 'K'

"Linting
" Python Linting
"




"let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
" enable fonts for ar line
"let g:airline#extensions#tabline#enabled = 0
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#fnamemod = ':t'

"augroup vimrc_autocmds
"    autocmd!
"    " highlight characters past column 120
"    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"    autocmd FileType python match Excess /\%120v.*/
"    autocmd FileType python set nowrap
"    augroup END
"
"filetype plugin indent on
syntax on



"color jellybeans
set background=dark
colorscheme Monokai
"let g:jellybeans_use_term_italics = 1


"easy motion
"search map bad don'tlike it
"map  / <Plug>(easymotion-sn)
"omap / <Plug>(easymotion-tn)

set nocompatible
"filetype off
"filetype plugin on

" FIX COMMENT INDENT SHIT
filetype indent on
filetype plugin on
"set smartindent
" set nosmartindent
" set cindent
" set cinkeys-=0#
" set indentkeys-=0#




"set showmatch
set guifont=Source\ Code\ Pro\ for\ Powerline:h13
set laststatus=2
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set termencoding=utf-8









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
"nmap <leader>s<left>   :leftabove  vnew<cr>
"nmap <leader>s<right>  :rightbelow vnew<cr>
"nmap <leader>s<up>     :leftabove  new<cr>
"nmap <leader>s<down>   :rightbelow new<cr>

nmap <leader>f :GitFiles<cr>

" Tab between buffers
"noremap <tab> <c-w><c-w>
map <F2> :bprevious<CR>
map <F3> :bnext<CR>
" Switch between last two buffers
nnoremap <leader><leader> <C-^>

""" Save EXIT Z
nnoremap <leader>z  :wq!<cr>


" Resize buffers
if bufwinnr(1)
	nmap Ä <C-W><<C-W><
	nmap Ö <C-W>><C-W>>
	nmap ö <C-W>-<C-W>-
	nmap ä <C-W>+<C-W>+
endif

" Syntastic

""set line
set nu
set cursorline


augroup ansible_vim_fthosts
	autocmd!
	autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
augroup END


au BufRead,BufNewFile *.yml set filetype=yaml.ansible
" au BufRead,BufNewFile *.j2 set filetype=yaml.ansible
" au BufRead,BufNewFile *.ini set filetype=yaml.ansible


autocmd FileType yaml.ansible setlocal commentstring=#\ %s

" autocmd BufNewFile,BufReadPost * if &filetype == yaml expandtab shiftwidth=2 indentkeys-=0# | endif
" autocmd BufNewFile,BufReadPost * filetype == yaml expandtab shiftwidth=2 indentkeys-=0#



" CtrlP
"nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100


" Go programming
"set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim
set rtp+=/usr/local/opt/fzf

" Quit with :Q
command -nargs=0 Quit :qa!


