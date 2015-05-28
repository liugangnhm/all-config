set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'Valloric/YouCompleteMe'

" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'vim-scripts/taglist.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'tomtom/tcomment_vim'

Plugin 'vim-scripts/a.vim'

Plugin 'fatih/vim-go'

Plugin 'molokai'
Plugin 'majutsushi/tagbar'

" auto close brace
"Plugin 'Townk/vim-autoclose'
Plugin 'scrooloose/nerdtree'
"Plugin 'brookhong/k.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'bling/vim-airline'
Plugin 'vim-colors-solarized'


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
set hlsearch
set incsearch
set ignorecase
set completeopt=longest,menu

let g:ycm_global_ycm_extra_conf = '~/bin/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion = 1
"let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_seed_identifiers_with_syntax=1 
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_tags_files = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
""注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nmap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>



let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<m-j>"
let g:UltiSnipsJumpBackwardTrigger="<m-j>"
let g:UltiSnipsEditSplit="vertical"


set cin
set sw=4
set tabstop=4
set softtabstop=4
set autoindent
"set nu

let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口 
"map <silent> <F9> :TlistToggle<cr> 
"
"-rw-r--r-- 1 root root 2476 10月 21 00:10 blue.vim
"-rw-r--r-- 1 root root 2990 10月 21 00:10 darkblue.vim
"-rw-r--r-- 1 root root  548 10月 21 00:10 default.vim
"-rw-r--r-- 1 root root 2522 10月 21 00:10 delek.vim
"-rw-r--r-- 1 root root 2812 10月 21 00:10 desert.vim
"-rw-r--r-- 1 root root 1666 10月 21 00:10 elflord.vim
"-rw-r--r-- 1 root root 2476 10月 21 00:10 evening.vim
"-rw-r--r-- 1 root root 1958 10月 21 00:10 industry.vim
"-rw-r--r-- 1 root root 3476 10月 21 00:10 koehler.vim
"-rw-r--r-- 1 root root 2460 10月 21 00:10 morning.vim
"-rw-r--r-- 1 root root 2006 10月 21 00:10 murphy.vim
"-rw-r--r-- 1 root root 1037 10月 21 00:10 pablo.vim
"-rw-r--r-- 1 root root 2673 10月 21 00:10 peachpuff.vim
"-rw-r--r-- 1 root root 2640 10月 21 00:10 README.txt
"-rw-r--r-- 1 root root 1393 10月 21 00:10 ron.vim
"-rw-r--r-- 1 root root 2720 10月 21 00:10 shine.vim
"-rw-r--r-- 1 root root 2445 10月 21 00:10 slate.vim
"-rw-r--r-- 1 root root 1629 10月 21 00:10 torte.vim
"-rw-r--r-- 1 root root 1840 10月 21 00:10 zellner.vim

"colorscheme ron 
"if has("gui_running")
"let g:solarized_termcolors=256
"set background=dark
"set background=light
colorscheme elflord 
"let g:solarized_termcolors=256
"endif
let g:molokai_original = 1
hi Search term=standout ctermfg=0 ctermbg=3 guifg=Black guibg=Yellow

map <C-A> :A<cr>


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


function Search_Word()
	let w = expand("<cword>") " 在当前光标位置抓词
	execute "vimgrep " . w . " **/*.go"
endfunction


autocmd BufWritePre *.go :GoImports
"autocmd VimEnter * :TagbarToggle
"autocmd BufReadPost * :TagbarToggle
"autocmd BufWinEnter * :TagbarToggle
"autocmd BufEnter * :TagbarToggle
"set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"set guifont=BitstreamVeraSansMono\ 10
"set guifont=DejaVuSansMono\ 10
set guifont=UbuntuMono\ 10
"autocmd BufReadPost * :NERDTree


func! GOBuild()
	exec "w"
	exec "!go build %"
endfunc

" -------------- Key Mapping
nmap <C-D> gd
"map <C-b> :GoBuild<cr>
map <M-b> :call GOBuild() <CR>
"map <silent> <C-b> :!go build -o a.out<cr>
map <2-LeftMouse> gd
map <RightMouse> <C-o>
map <F9> :TagbarToggle<cr>
map <C-i> :GoInfo<cr>
map <C-x> :q<cr>
map <F10> :cw<cr>
map <F12> :ccl<cr>
map <Leader>sw :call Search_Word()<CR>:botright copen<CR>
map <Leader>ag :Ag<CR>

map <C-t> :CtrlPBuffer<cr>

" show byte-offset in status bar
" set statusline+=%o
"
"
"
" ctrlp search file name only
let g:ctrlp_by_filename = 1

"set mouse=a

map <Leader>t :CtrlPTag <cr>
let g:ctrlp_working_path_mode = '0'

let g:airline_powerline_fonts = 1

autocmd VimEnter * nested :call tagbar#autoopen(1)

