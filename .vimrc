" initialize
set nocompatible                " 不兼容VI
if has('autocmd')
  filetype plugin indent on
            " │     │    └───── Enable file type detection.
            " │     └────────── Enable loading of indent file.
            " └──────────────── Enable loading of plugin files.
endif
if &t_Co > 2 || has("syntax")
    syntax on
endif

" utf-8
set encoding=utf-8
set termencoding=utf-8

" settings
set hidden                      " 允許不保存切換buffer
set hlsearch                    " Highlight found searches
set ignorecase                  " 忽略搜索模式中的大小寫
set incsearch                   " Shows the match while typing
set nobackup
set noerrorbells                " No beeps
set noswapfile
set nowrap                      " 關閉自動摺行
set nowritebackup               " only in case you don't want a backup file while editing
set number                      " 顯示行號
set showcmd
set showmatch                   " 顯示匹配的括號
set splitbelow                  " 新分割窗口在下面
set splitright                  " 新分割窗口在右邊
set termguicolors
set wildmenu
set backspace=indent,eol,start  " 設定 delete刪除鍵
set colorcolumn=80
set scrolloff=1                 " 距離頂部和底部5
" set cursorline
" set cursorcolumn

" clipboard
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" hidden-characters
"   https://gist.github.com/while0pass/511985
set list
set lcs=tab:▒░,trail:▓,nbsp:░
au OptionSet number :if v:option_new | set showbreak= | else | set showbreak=↪ | endif

au CmdlineEnter * redraws
" autocmd bufwritepost .vimrc source $MYVIMRC

" keys
"   :'<,'>%!column -t
"   :'<,'>%!sort -f -k2
nmap  *           m`:keepjumps normal! *``<CR>
nmap  <Down>      <Nop>
nmap  <Leader>s   :update<CR>:edit<CR>
nmap  <Left>      <Nop>
nmap  <Right>     <Nop>
nmap  <S-Tab>     <<_
nmap  <silent>zm  zM
nmap  <silent>zr  zR
nmap  <Space>h    <C-w>h
nmap  <Space>j    <C-w>j
nmap  <Space>k    <C-w>k
nmap  <Space>l    <C-w>l
nmap  <Tab>       >>_
nmap  <Up>        <Nop>
nmap  c#          ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN
nmap  c*          /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
nmap  d#          ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
nmap  d*          /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nmap  gx          viW"ay:!open <C-R>a &<CR>
nmap  H           ^
nmap  J           ]m
nmap  K           [m
nmap  L           $
nmap  U           <C-R>
nmap  zm          zM
nmap  zr          zR
" nmap  N           Nzzzv
" nmap  n           nzzzv

vmap  <Leader>s   :update<CR>:edit<CR>
vmap  J           :m '>+1<CR>gv
vmap  K           :m '<-2<CR>gv
vmap  <S-Tab>     <gv
vmap  <Tab>       >gv
vmap  *           m`:keepjumps normal! *``<CR>

" language
"   └──── python
"   └──── vim
      au Filetype vim set autoindent expandtab ts=2 sts=2 sw=2
      au Filetype sh  set autoindent expandtab ts=2 sts=2 sw=2

" vim-plug
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync |  source $MYVIMRC | exit
  \| endif
call plug#begin('~/.vim/plugged')
  " '<,'>sort /^[^/]*/
  Plug 'tmhedberg/SimpylFold' |
    \ Plug 'Konfekt/FastFold'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} |
    \ Plug 'antoinemadec/coc-fzf'
  Plug 'junegunn/fzf', {'do': { -> fzf#install() } } |
    \ Plug 'junegunn/fzf.vim' |
    \ Plug 'chengzeyi/fzf-preview.vim'
  Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle' } |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' |
    \ Plug 'ryanoasis/vim-devicons'
  Plug 'chriskempson/base16-vim'
  Plug 'rhysd/conflict-marker.vim'
  Plug 'cdddg/iceberg.vim', {'branch': 'offline'}         " cocopon/iceberg.vim
  Plug 'yggdroot/indentline'
  Plug 'haya14busa/is.vim'
  Plug 'luochen1990/rainbow'
  Plug 'mechatroner/rainbow_csv'
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-commentary'
  Plug 'hrsh7th/vim-eft'
  Plug 'voldikss/vim-floaterm'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'itchyny/vim-highlighturl'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'junegunn/vim-peekaboo'
  Plug 'sheerun/vim-polyglot'
  Plug 'airblade/vim-rooter'
  Plug 'kana/vim-textobj-indent'
  Plug 'bps/vim-textobj-python'
  Plug 'kana/vim-textobj-user'
  Plug 'jmcantrell/vim-virtualenv'
  " Plug 'pseewald/vim-anyfold'
  " Plug 'skammer/vim-css-color'
call plug#end()

" colorscheme
if has("gui_running")
  set guifont=FiraCode\ Nerd\ Font:h12
  set guioptions-=r
  set guioptions-=L
  set guioptions+=k
  set guioptions-=b
  set linespace=2
  set bg=dark
  colorscheme iceberg
endif

" register
command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
autocmd VimEnter * WipeReg

" plug-conf
for p in g:plugs_order
  if p == "iceberg" && g:colors_name != "iceberg"
  else
    if p[-4:] == ".vim" | let p = p[:-5] | endif
    let p = "$HOME/.vim/conf/".p.".vim"
    if !empty(expand(glob(p))) | execute "source ".p | endif
  endif
endfor
