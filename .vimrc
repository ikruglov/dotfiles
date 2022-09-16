""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Ivan Kruglov
" Based on: http://amix.dk/vim/vimrc.html
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.so,*.swp,*.zip

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable numbers
set number

" Performance improvments
if has("mac")
  set nocursorline

  if exists("+relativenumber")
    set norelativenumber
  endif

  set foldlevel=0
  set foldmethod=manual
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
colorscheme darkblue
set encoding=utf8

" Highlight current line
" set cursorline
if &t_Co == 256
    highlight CursorLine term=NONE cterm=NONE ctermbg=233
else
    highlight CursorLine term=bold cterm=bold
endif

highlight LineNr ctermfg=darkgrey
highlight Visual ctermfg=darkcyan ctermbg=darkblue
highlight ErrorMsg ctermbg=darkred

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType jsonnet setlocal ts=2 sts=2 sw=2 expandtab
autocmd BufEnter *.TEMPLATE :setlocal filetype=jsonnet

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
set laststatus=2
set statusline=*%f%m%r%h%w\ %y\ enc:%{&enc}\ ff:%{&ff}\ fenc:%{&fenc}%=(ch:%3b\ hex:%2B)\ col:%2c\ line:%2l/%L\ [%2p%%]
if &t_Co == 256
    highlight StatusLine ctermbg=233
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
map 0 ^
nnoremap <CR> :noh<CR><CR>:<backspace>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeWinPos='right'
let NERDTreeCaseSensitiveSort=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDComment
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:let mapleader = ","
:let NERDSpaceDelims=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP (https://github.com/kien/ctrlp.vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

"let g:ctrlp_user_command = 'find %s -type f'
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => pathogen (https://github.com/tpope/vim-pathogen)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()
" help vim find docs
Helptags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-go (https://github.com/fatih/vim-go)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt-=preview
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic (https://github.com/scrooloose/syntastic)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_go_checkers = [ 'govet', 'errcheck' ]
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': [''] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => jsonnet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsonnet_fmt_options = " --string-style l --comment-style l"
let g:jsonnet_fmt_fail_silently = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set mmp=2000
