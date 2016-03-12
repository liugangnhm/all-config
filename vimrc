" bundle code and plugin {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'L9'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"Plugin 'vim-scripts/taglist.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'vim-scripts/a.vim'
Plugin 'fatih/vim-go'
Plugin 'molokai'
Plugin 'majutsushi/tagbar'
" auto close brace
"Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
"Plugin 'brookhong/k.vim'
"Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'
" smooth scroll
"Plugin 'yonchu/accelerated-smooth-scroll'
Plugin 'vim-scripts/cmdline-completion'
Plugin 'airblade/vim-gitgutter'
"Plugin 'gcmt/wildfire.vim'
Plugin 'terryma/vim-expand-region'
"Plugin 'fabi1cazenave/kalahari.vim'
"Plugin 'justincampbell/vim-railscasts'
"Plugin 'vim-scripts/abbott.vim'
Plugin 'jiangmiao/auto-pairs'
" Plugin 'scrooloose/syntastic'
" auto tag update
"Plugin 'vim-scripts/AutoTag'
"Plugin 'craigemery/vim-autotag'
Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'szw/vim-tags'
Plugin 'godlygeek/csapprox'
Plugin 'sheerun/vim-wombat-scheme'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'KabbAmine/zeavim.vim'
Plugin 'tell-k/vim-autopep8'
Plugin 'MattesGroeger/vim-bookmarks'

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" }}}
" basic vim config {{{
set hlsearch
set incsearch
set ignorecase
set cin
set sw=4
set tabstop=4
set softtabstop=4
set autoindent
set nu
set completeopt=longest,menu
" }}}
" ycm config {{{
"let g:ycm_global_ycm_extra_conf = '~/bin/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax=1 
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 0
let g:ycm_collect_identifiers_from_tags_files = 0
let g:ycm_cache_omnifunc=0
"\u5728\u5b57\u7b26\u4e32\u8f93\u5165\u4e2d\u4e5f\u80fd\u8865\u5168
let g:ycm_complete_in_strings = 1
""\u6ce8\u91ca\u548c\u5b57\u7b26\u4e32\u4e2d\u7684\u6587\u5b57\u4e5f\u4f1a\u88ab\u6536\u5165\u8865\u5168
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
" }}}

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<m-j>"
let g:UltiSnipsJumpBackwardTrigger="<m-j>"
let g:UltiSnipsEditSplit="vertical"
set t_Co=256

if has('gui_running')
	colorscheme molokai
else
	let g:solarized_termcolors=256
	colorscheme molokai
endif

hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow
map <C-A> :A<cr>

" tagbar_type_go {{{
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

" }}}

autocmd BufWritePre *.go :GoImports
"autocmd BufReadPost * :NERDTree
"bind NERDTree triggle
map <F6> :NERDTreeToggle<cr>

" -------------- Key Mapping
let g:go_def_mapping_enabled=0
map <2-LeftMouse> gd
map <RightMouse> <C-o>
map <F9> :TagbarToggle<cr>
map <C-x> :q<cr>
map <F10> :cw<cr>
map <F12> :ccl<cr>:lcl<cr>
map <Leader>sw :call Search_Word()<CR>:botright copen<CR>
map <Leader>ag :Ag<CR>

map <C-t> :CtrlPBuffer<cr>
"map :copen<CR>:botright copen<CR>
"map :cwindow<CR>:botright cwindow<CR>

" show byte-offset in status bar
" set statusline+=%o
"
"
"
" ctrlp search file name only
let g:ctrlp_by_filename = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'

"set mouse=a

nnoremap <C-r> :CtrlPBufTag <cr>
nnoremap <C-e> :CtrlPTag <cr>
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

let g:airline_powerline_fonts = 1

autocmd VimEnter * nested :call tagbar#autoopen(1)
"let g:airline_theme='delek'

" cursor always on the middle of window
set so=999


" This selects the next closest text object.
" let g:wildfire_fuel_map = "<ENTER>"

" This selects the previous closest text object.
" let g:wildfire_water_map = "<BS>"
" let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]

map <SPACE> <Plug>(expand_region_expand)
map <BS> <Plug>(expand_region_shrink)

" golang
function g:GolangOption()
  if &filetype=="go" 
	  let g:go_oracle_scope='github.com'
	  map <C-D> :GoDef<CR>
	  map <F3> :GoChannelPeers<CR>
	  map <F4> :GoImplements<CR>
	  map <F5> :GoReferrers<CR>
	  nnoremap <leader>ft :GoTestFunc<cr>
  endif
endfunction
autocmd FileType * call g:GolangOption()
" auto call :GoInfo when move cursor
let g:go_auto_type_info = 1

" set font {{{
function g:SetFont()
	if has('mac')
		set guifont=Sauce\ Code\ Powerline\:h13
	else
		set guifont=Source\ Code\ Pro\ for\ Powerline\ Bold\ 13
		let g:PowerlineSymbols='fancy'
		set encoding=utf8
	endif
endfunction
autocmd VimEnter * call g:SetFont()
" }}}

autocmd FileType qf wincmd J

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

let g:ctrlp_follow_symlinks = 2
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'dir', 'rtscript',
                          \ 'undo', 'line', 'changes', 'mixed', 'bookmarkdir']
" convenient key maps {{{
inoremap jk <esc><esc>:w<cr>
nnoremap ss :w<cr>
nnoremap <SPACE> :
" move left in insert mode
inoremap <C-l> <esc><esc>lli
" move to end of line in insert mode
inoremap <M-l> <esc><esc>A
nnoremap <Leader>cpw viw"+y
nnoremap <Leader>pl :CtrlPLine<cr>
"inoremap <esc> <nop>
" }}}
" comment key {{{
autocmd FileType javascript nnoremap <buffer> <leader>c I//<esc>j<esc>I<esc>
autocmd FileType go nnoremap <buffer> <leader>c I//<esc>j<esc>I<esc>
autocmd FileType python nnoremap <buffer> <leader>c I#<esc>j<esc>I<esc>
autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>j<esc>I<esc>
" }}}
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
	" found vimscript automatic
	autocmd FileType vim setlocal foldmethod=marker 
augroup END
" }}}
" auto jump to tagbar and search tag and then jump to tag{{{
let g:has_exit_ctrlp_buf = 0
function g:EnterEnter()
	let g:has_exit_ctrlp_buf = 1
	execute "sleep 100m"
	if g:has_exit_ctrlp_buf 
		echom "has exit buf"
		execute "call feedkeys(\"\<CR>\")"
		let g:has_exit_ctrlp_buf = 0
	endif
endfunction

function g:SearchTagAndJump()
  let g:ctrlp_buffer_func = {
    \ 'exit':  'g:EnterEnter',
    \ }
	execute "CtrlPLine __Tagbar__"
	let g:ctrlp_buffer_func = {}
endfunction 
"nnoremap <leader>t :CtrlPLine __Tagbar__<cr>
nnoremap <leader>t :call g:SearchTagAndJump()<cr>
" }}}
" ctrlp tag bin
let g:ctrlp_buftag_types = {
	\ 'go'     	   : '--language-force=go --golang-types=ftv',
    \ }

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/


au FileType qf call AdjustWindowHeight(5, 20)
function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

nnoremap <F11> :cn<cr>
noremap <c-F11> :cp<cr>

let g:gitgutter_highlight_lines = 1
let g:tagbar_width = 30
set wrap
set linebreak
set showbreak=\ \ \ \  
set clipboard=exclude:.*

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
nnoremap <c-b> k8
nnoremap <c-f> j8

" new line in insert mode
inoremap <S-CR> <Esc>o

" auto load changed file
set autoread

let g:autopep8_disable_show_diff=1

" bookmark options
let g:bookmark_highlight_lines = 1
let g:bookmark_save_per_working_dir = 1
let g:bookmark_auto_close = 1
