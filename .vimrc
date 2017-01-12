"首先引入包管理插件需要暂时关闭filetype
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'kchmck/vim-coffee-script'
Plugin 'isRuslan/vim-es6'
call vundle#end()
filetype plugin indent on
"html 插件快捷键修改
let g:user_emmet_leader_key='<C-Z>'
if has('win32')
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim

    "初始窗口的宽度
    set columns=125

    "初始窗口的高度
    set lines=45

    "初始窗口的位置
    winpos 52 42

    set encoding=prc

    set diffexpr=MyDiff()
    function! MyDiff()
        let opt = '-a --binary '
        if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
        if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
        let arg1 = v:fname_in
        if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
        let arg2 = v:fname_new
        if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
        let arg3 = v:fname_out
        if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
        let eq = ''
        if $VIMRUNTIME =~ ' '
            if &sh =~ '\<cmd'
                let cmd = '""' . $VIMRUNTIME . '\diff"'
                let eq = '"'
            else
                let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
            endif
        else
            let cmd = $VIMRUNTIME . '\diff'
        endif
        silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
    endfunction
endif
syntax enable
set nocompatible
set modelines=0

colorscheme desert
if has('gui_running')
    set background=dark
else
    set background=light
endif

set nobackup
set noswf
set autoindent
set guioptions-=T
set modelines=0
""实用设置------------------
"代码补全
set completeopt=preview,menu
" 自动缩进
set autoindent


"解决中文乱码问题
set fileencodings=utf-8,cp936,gb18030,gbk,big5
set termencoding=utf-8

"设置tab宽度
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set scrolloff=3
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set statusline=%<[%n]\%F\%h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}][%{&ff}][ASCII=\%03.3b]\%-10.(%l,%c%V%)\%P

set number
"set undofile

let mapleader = ","

"驯服Vim的默认搜索正则表达式
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

nnoremap <leader>1 :set filetype=xhtml<cr>
nnoremap <leader>2 :set filetype=css<cr>
nnoremap <leader>3 :set filetype=javascript<cr>

"tab切换
map <C-right>   :tabnext<cr>
map <C-left>   :tabprevious<cr>
nmap <C-n>   :NERDTreeToggle <cr>

 "匹配括号的规则，增加针对html的<>
set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首行尾时自动移到下一行（包括insert模式）
set whichwrap=b,s,<,>,[,]
"Nerd tree
nmap <silent> <leader>nt :NERDTreeToggle .<cr>

"CtrlP插件，模拟Sublime Ctrl + P功能
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'rc'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
set wildignore+=tmp\*,*.swp,*.zip,*.exe   " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
nmap f :call EasyMotion#WB(0, 0)<CR>
nmap F  :call EasyMotion#WB(0, 1)<CR>

autocmd BufWritePre * :%s/\s\+$//e

