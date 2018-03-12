" Plugin section {{{
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
"call plug#begin('~/.vim/plugged')
"if has('nvim')
"call plug#begin('~/.local/share/nvim/plugged')
"else
"call plug#begin('~/.vim/plugged')
"endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'junegunn/vim-easy-align'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode'
Plugin 'junegunn/fzf'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/a.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'jeetsukumaran/ctrlp-pythonic.vim'
Plugin 'bling/vim-airline'
Plugin 'SirVer/ultisnips'
Plugin 'scrooloose/nerdtree'

if has('nvim')
	Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plugin 'zchee/deoplete-go', { 'do': 'make'}
	Plugin 'davidhalter/jedi'
	Plugin 'zchee/deoplete-jedi'
	"Plugin 'Shougo/neosnippet'
	"Plugin 'Shougo/neosnippet-snippets'
endif
Plugin 'tell-k/vim-autopep8'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'
Plugin 'pelodelfuego/vim-swoop'
" snippets
"Plugin 'honza/vim-snippets'
Plugin 'molokai'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'rhysd/vim-clang-format'
Plugin 'easymotion/vim-easymotion'

"call plug#end()
call vundle#end()            " required
filetype plugin indent on    " required
" }}}
" neovim {{{
if has('nvim')
	let g:deoplete#enable_at_startup = 1
	" deoplete tab-complete
	inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	let g:deoplete#auto_complete_start_length = 1
	let g:go_term_mode = "split"
	"let g:python_host_prog = '/usr/local/bin/python2'
	"let g:python3_host_prog = '/usr/local/bin/python3'
	let g:deoplete#sources#go#gocode_binary = '~/Dev/gopath'
	let g:deoplete#sources#go#package_dot = 1
	let g:deoplete#sources#go#sort_class = ['const','package', 'func', 'type', 'var']
	let g:deoplete#sources#go#auto_goos = 1
	let b:deoplete_disable_auto_complete = 0
endif
" }}}
"python config{{{ 
function g:PythonOption()
	if &filetype=="python"
		nnoremap <C-e> :CtrlPPythonic<Cr>
	endif
endfunction
autocmd FileType python call g:PythonOption()

let g:deoplete#sources#jedi#python_path="/usr/local/bin/python3"
let g:deoplete#sources#jedi#show_docstring=1
"}}}
" format and indent {{{
syntax enable
set hlsearch
set incsearch
set ignorecase
set cin
set sw=2
set tabstop=2
set softtabstop=2
set autoindent
set nu
set foldmethod=marker
" cursor always on the middle of window
set so=10
" }}}
" set font {{{
function g:SetFont()
	if has('mac')
		set guifont=Sauce\ Code\ Powerline\:h13
	else
		set guifont=Source\ Code\ Pro\ for\ Powerline\ Bold\ 13
		let g:PowerlineSymbols='fancy'
		set encoding=utf8
	endif
	let g:solarized_termcolors=256
	colorscheme molokai
endfunction
autocmd VimEnter * call g:SetFont()
" }}}
" Key Bind Common{{{
let mapleader = ','
inoremap jk <esc><esc>:w<cr>
nnoremap ss :w<cr>
nnoremap <SPACE> :
" move left in insert mode
inoremap jl <esc><esc>lli
" move to end of line in insert mode
inoremap je <esc><esc>A
" new line in insert mode
inoremap jo <Esc><Esc>o
" }}}
" tagbar config {{{
map <F9> :TagbarToggle<cr>
" }}}
" Golang {{{
function g:GolangOption()
	if &filetype=="go"
		let g:go_oracle_scope='github.com'
		map <C-D> :GoDef<CR>
		map <F3> :GoChannelPeers<CR>
		map <F4> :GoImplements<CR>
		map <F5> :GoReferrers<CR>
		map <C-R> :GoDecls<CR>
		nnoremap <leader>ft :GoTestFunc<cr>
	endif
endfunction
autocmd FileType go call g:GolangOption()

let g:tagbar_type_go = {
			\ 'ctagstype' : 'go',
			\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
			\ ],
			\ 'sro' : '.',
			\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
			\ },
			\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
			\ },
			\ 'ctagsbin'  : 'gotags',
			\ 'ctagsargs' : '-sort -silent'
			\ }
autocmd BufWritePre *.go :GoImports


"let g:go_auto_type_info = 1
let g:go_info_mode = 'gocode'
"let g:go_auto_sameids = 1
" }}}
" CtrlP Config{{{
let g:ctrlp_follow_symlinks = 2
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
			\ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
let g:ctrlp_buftag_types = {
			\ 'go'		   : '--language-force=go --golang-types=ftv',
			\ }
map <leader>t :CtrlPBuffer<cr>
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

" buff tag map key
"function g:SetBufferTagMap()
"if &filetype!="go"
"        nnoremap <C-r> :CtrlPBufTag <cr>
"	endif
"endfunction
"autocmd FileType * call g:SetBufferTagMap()

nnoremap <C-e> :CtrlPTag <cr>
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_extensions = ['pythonic']

" }}}
" Airline Config{{{
let g:airline_powerline_fonts = 1
" }}}
" Snip {{{
let g:UltiSnipsExpandTrigger="<C-J>>"
"imap <C-j>     <Plug>(neosnippet_expand_or_jump)
"smap <C-j>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-j>     <Plug>(neosnippet_expand_target)

"imap <C-j>     <Plug>(neosnippet_expand_or_jump)
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory='~/.local/share/nvim/plugged/vim-snippets'
" }}}
" NERDTree {{{
map <F6> :NERDTreeToggle<cr>
" }}}
" quickfix {{{
" Open quickfix window when text adds to it
augroup vimrc
  autocmd QuickFixCmdPost * botright copen 8
augroup END

au FileType qf call AdjustWindowHeight(5, 20)
function! AdjustWindowHeight(minheight, maxheight)
	exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction
" for pt asyncrun
set errorformat+=%f:%l:\ %m

" search for current file or buf
function g:PtCurrentWord()
	execute ":AsyncRun pt <cword> --nocolor --nogroup \%:p"
	execute ":cw"
endfunction
nnoremap <leader>sS :call g:PtCurrentWord()<cr>

" }}}
"{{{ EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap <leader>jj <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)
"}}}

"{{{ ycm
let g:ycm_min_num_of_chars_for_completion = 1
"}}}
" auto load file
set autoread
