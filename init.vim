

"New changes

"if has('nvim')
"	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"end
""set t_Co=256
"set termguicolors

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set rtp+=~/.config/nvim/autoload

call plug#begin('~/.config/nvim/autoload')
"Color Boje
"Plug 'flazz/vim-colorschemes'
"-------------- Comments -------------------------
Plug 'tpope/vim-commentary'

Plug 'tpope/vim-liquid'

"" Fish syntax higlater 
Plug 'dag/vim-fish'



"Plug 'phenomenes/ansible-snippets'
" We love Icons 
Plug 'ryanoasis/vim-devicons'


" Replace two collumnus left right
" :%s/\v^(\S+)\s+(\S+).*$/\2 \1/
"
""" LIVE RELOAD NEOVIM


"
""COC REMOVE
Plug 'neoclide/coc.nvim', {'branch': 'release'}


""------------------- Autosave vim NEOVIM ------------------------
"
"
"Plug '907th/vim-auto-save'

"let g:auto_save = 1

"let g:auto_save_events = ["InsertLeave"]

"let g:auto_save_in_insert_mode = 0
""------------------- EOF Autosave vim NEOVIM ------------------------


"---------------------- Elixir autocompletion ------------------------
"
"Plug 'slashmili/alchemist.vim'


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

"Plug 'dense-analysis/ale'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }

"Auto Forma on save
"Plug 'Chiel92/vim-autoformat'



" Teraform 
"Plug 'hashivim/vim-terraform'
"Plug 'vim-syntastic/syntastic'
"Plug 'juliosueiras/vim-terraform-completion'

" Remove less space plugin

"  Plug 'thirtythreeforty/lessspace.vim'
" Search silver brew install the_silver_searcher require to install searcher
" Poligota
"Plug 'sheerun/vim-polyglot'
"Plug 'nathanaelkane/vim-indent-guides'
" Plug 'Lokaltog/vim-easymotion'

"-- Allows tmux move between  panes ----

Plug 'christoomey/vim-tmux-navigator'

""YANK TMUX

"Plug 'roxma/vim-tmux-clipboard'

" FZF setting ctrlp other
set rtp+=/usr/local/opt/fzf

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'



" post install (yarn install | npm install) then load plugin only for editing supported files


let g:webdevicons_enable = 1


Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql','markdown', 'vue', 'yaml', 'html'] }

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


" coc refactor
" nnoremap <leader>em :CocCommand python.refactorExtractMethod<cr>
" vnoremap <leader>em :CocCommand python.refactorExtractMethod<cr>
" nnoremap <leader>ev :CocCommand python.refactorExtractVariable<cr>



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

" inoremap <silent><expr> <c-l> coc#refresh()

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" Coc GOTO FUNCTIOJN

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.0 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" NeoVim-only mapping for visual mode scroll
" Useful on signatureHelp after jump placeholder of snippet expansion
if has('nvim')
  vnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#nvim_scroll(1, 1) : "\<C-f>"
  vnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#nvim_scroll(0, 1) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>



" FZF {{{
" <C-p> or <C-t> to search files
nnoremap <silent> <C-t> :History <cr>
nnoremap <silent> <C-p> :FZF -m<cr>

" <M-p> for open junegunn/fzf.vimbuffers
" nnoremap <M-e> :Buffers <cr>
"nnoremap <M-E> :History <cr>

nnoremap <Leader>d :Buffers<cr>
nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>r :reg<cr>

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

"let g:ansible_unindent_after_newline = 3
"let g:ansible_attribute_highlight = "ob"
"let g:ansible_name_highlight = 'd'
"let g:ansible_extra_keywords_highlight = 1
"let g:ansible_yamlKeyName = 'yamlKey'
"let g:ansible_template_syntaxes = { '*.j2': '.config.j2' }
"let g:ansible_with_keywords_highlight = 'Constant'
"++++++++++++++++++ansible-vim Plugin++++++++++++++++
let g:ansible_unindent_after_newline = 0
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
"let g:ansible_yamlKeyName = 'yamlKey'
let g:ansible_normal_keywords_highlight = 'Constant'
let g:ansible_with_keywords_highlight = 'Constant'
let g:ansible_template_syntaxes = { '*.rb.j2': 'ruby', '*.yml': 'yaml.ansible','*.j2': 'ruby.jinja2' }
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile /etc/ansible/roles/*/*/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile /etc/ansible/roles/*/templates/*.j2 set filetype=ruby.jinja2
"++++++++++++++++++++++++++++++++++++++++++++++++++++


""" Other Configurations ###PYTHON STUFF
filetype plugin indent on
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent
set incsearch ignorecase smartcase hlsearch
set ruler laststatus=2 showcmd showmode
set list listchars=trail:»,tab:»-
set fillchars+=vert:\ 
set wrap breakindent
set encoding=UTF-8
set number
set title
"" allow buffer hidden
set hidden
"" disable foddables i hate that
set nofoldenable    " disable folding
"
"
"
"
"
"
"

"
"
"
"" Fix files with prettier, and then ESLint.
"let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
"let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
"--- ALE LINTER -----
" let g:ale_echo_cursor = 1
" let g:ale_echo_msg_error_str = 'Error'
" let g:ale_echo_msg_format = '%s'
" let g:ale_echo_msg_warning_str = 'Warning'
" let g:ale_enabled = 1
" let g:ale_fix_on_save = 0

" let g:ale_fixers = {
" 			\   'javascript': ['prettier'],
" 			\   'html': ['prettier'],
" 			\   'css': ['prettier'],
" 			\   'yaml': ['prettier'],
" 			\   'yaml.ansible': ['prettier'],
"             \   'elixir': ['mix_format'],
" 			\   'python': ['black','yapf'],
" 			\}

" let g:ale_linters = {
"          \'python': ['flake8'],
"          \'elixir': ['elixir-ls'],
"          \}
" " Disable warnings about trailing whitespace for Python files.
" let g:ale_warn_about_trailing_whitespace = 0

" let g:ale_keep_list_window_open = 0
" let g:ale_lint_delay = 200
" let g:ale_lint_on_enter = 1
" let g:ale_lint_on_save = 1
" let g:ale_lint_on_text_changed = 'always'
" let g:ale_open_list = 0
" let g:ale_set_highlights = 1
" let g:ale_set_loclist = 1
" let g:ale_set_quickfix = 0
" let g:ale_set_signs = 1
" let g:ale_sign_column_always = 0
" let g:ale_sign_error = '✗'
" let g:ale_sign_offset = 1000000
" let g:ale_sign_warning = '▲'
" let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
" let g:ale_warn_about_trailing_whitespace = 1
" " Disable ale completitio uses coc
" let g:ale_completion_enabled = 0


" deoplete testing


" Deoplete enable
" let g:deoplete#enable_at_startup = 1

" deoplete tab-complete
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


" let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
" let g:deoplete#ignore_sources.php = ['omni']
" call deoplete#custom#option('sources', {
" 			\ '_': ['ale', 'omni', 'around', 'buffer', 'tag', 'member', 'file' ],
" 			\ 'php': ['ale', 'phpactor', 'around', 'buffer', 'member', 'file', ],
" 			\ 'javascript': ['ale', 'tern', 'around', 'buffer', 'member', 'file']
" 			\})
" let g:deoplete#enable_smart_case = 1
" let g:deoplete#file#enable_buffer_path = 1
" let g:deoplete#auto_complete_delay = 3


set completeopt=longest,menuone,preview


" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?

"let g:neosnippet#enable_completed_snippet = 1
"let g:neosnippet#enable_snipmate_compatibility = 1

"" Qucik save
noremap <Leader>s :update<CR>
vnoremap <Leader>s :update<CR>
inoremap <Leader>s :update<CR>

"" Quit File no save
noremap <Leader>q :q!<CR>

"" RunRG Grep
noremap <Leader>rg :Rg<CR>


"noremap <F3> :AleFixer<CR>
""autocmd FileType python nnoremap <Leader>p :Autoformat<CR>
noremap <Leader>p :call CocAction('format')<CR>




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
set cursorcolumn


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


 let g:coc_filetype_map = {
 \ 'yaml.ansible': 'yaml',
 \ }


" CtrlP
"nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 1
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
let g:ctrlp_max_depth = 100

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.

" Go programming
"set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim

" Quit with :Q
command -nargs=0 Quit :qa!


