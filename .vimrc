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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable
colorscheme darkblue
set encoding=utf8

" Highlight current line
set cursorline
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
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
"let g:go_fmt_autosave = 0
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-rust (https://github.com/rust-lang/rust.vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rustfmt_autosave = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => syntastic (https://github.com/scrooloose/syntastic)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:loaded_syntastic_go_gofmt_checker = 0
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck' ]
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['perl'] }
let g:syntastic_c_checkers = [] " disable syntastic for C (it's buggy)
let g:syntastic_java_checkers = [] " disable syntastic for Java (it's buggy)
let g:syntastic_enable_perl_checker = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => neocomplete (https://github.com/Shougo/neocomplete.vim)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists('g:pathogen_disabled')
    let g:pathogen_disabled = []
endif

" neocomplete requires Vim 7.3 and Lua
if v:version < 703 || !has('lua') || (v:version == 703 && !has('patch885'))
	call add(g:pathogen_disabled, 'neocomplete')
endif

if index(g:pathogen_disabled, 'neocomplete') == -1
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_auto_select = 1
    let g:neocomplete#auto_completion_start_length = 2
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#sources#tags#cache_limit_size = 16777216 " 16MB
    set completeopt-=preview

    " highlight Pmenu ctermbg=8 guibg=#606060
    " highlight PmenuSel ctermbg=1 guifg=#dddd00 guibg=#1f82cd
    " highlight PmenuSbar ctermbg=0 guibg=#d6d6d6

    " Plugin key-mappings.
    inoremap <expr> <C-g> neocomplete#undo_completion()
    inoremap <expr> <C-l> neocomplete#complete_common_string()

    " Recommended key-mappings.
    " <CR>: cancel popup and insert newline.
    inoremap <silent> <CR> <C-r>=neocomplete#smart_close_popup()<CR><CR>
    " <TAB>: completion.
    inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <BS>  neocomplete#smart_close_popup()."\<C-h>"
    inoremap <expr> <C-y> neocomplete#close_popup()
    inoremap <expr> <C-e> neocomplete#cancel_popup()
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
