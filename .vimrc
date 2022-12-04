" ╭-----------------╮
" ┆ Deprecate vi    ┆
" ╰-----------------╯
set nocompatible                " 不兼容VI


" ╭-----------------╮
" ┆ Encoding        ┆
" ╰-----------------╯
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8


" ╭-----------------╮
" ┆ Search          ┆
" ╰-----------------╯
set hlsearch                    " 突出顯示搜索詞
set incsearch                   " 輸入時就顯示匹配的項目
set ignorecase
set smartcase
    " | pattern | 'ignorecase' | 'smartcase' |   matches   |
    " | :-----: | :----------: | :---------: | :---------: |
    " |   foo   |     off      |      -      |     foo     |
    " |   foo   |     on       |      -      | foo Foo FOO |
    " |   Foo   |     on       |     off     | foo Foo FOO |
    " |   Foo   |     on       |     on      |     Foo     |
    " |  \cfoo  |      -       |      -      | foo Foo FOO |
    " |  foo\C  |      -       |      -      |    fooin    |


" ╭-----------------╮
" ┆ Backupfile      ┆
" ╰-----------------╯
set noswapfile
set nobackup
set nowritebackup
    " | backup | writebackup | action                                            |
    " | ------ | ----------- | ------------------------------------------------- |
    " | off    | off         | no backup made                                    |
    " | off    | on          | backup current file, deleted afterwards (default) |
    " | on     | off         | delete old backup, backup current file            |
    " | on     | on          | delete old backup, backup current file            |


" ╭-----------------╮
" ┆ Builtin Setting ┆
" ╰-----------------╯
set hidden                      " 當前緩衝區有未保存的更改時打 開一個新文件會導致文件被隱藏而不是關閉
set wildmenu | set wildmode=longest:list,full
                                " 第一個選項卡將完成最長的字符串並顯示匹配列表，然後第二個選項卡將完成第一個完整匹配並打開通配菜單。
set backspace=indent,eol,start  " 允許在插入模式下對所有內容進行退格
set showcmd                     " 在屏幕的最後一行顯示（部分）命令。 設置這個如果您的終端很慢，請關閉選項
set showmatch                   " 顯示對應的括號
set visualbell                  " 不要發出逼逼聲
set noerrorbells                " 不要發出逼逼聲
set splitbelow                  " 新分割窗口在下面
set splitright                  " 新分割窗口在右邊
set nowrap                      " 不要換行
set number                      " 顯示行號
set scrolloff=1                 " 距離頂部和底部的行數
set colorcolumn=80


" ╭-----------------╮
" ┆ ????????        ┆
" ╰-----------------╯
if has('autocmd')
  filetype plugin indent on
            " │     │    └───── Enable file type detection.
            " │     └────────── Enable loading of indent file.
            " └──────────────── Enable loading of plugin files.
endif
if &t_Co > 2 || has("syntax")
    syntax on
endif

au CmdlineEnter * redraws
" autocmd bufwritepost .vimrc source $MYVIMRC


" ╭-----------------╮
" ┆ Copy/Paste/Cut  ┆
" ╰-----------------╯
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed,unnamedplus
else
  set clipboard=unnamedplus
endif
" if has('unnamedplus')
"   set clipboard=unnamed,unnamedplus
" endif


" ╭-----------------------╮
" ┆ Set Hidden-characters ┆   https://gist.github.com/while0pass/511985
" ╰-----------------------╯
set list
set lcs=tab:▒░,trail:▓,nbsp:░
au OptionSet number :if v:option_new | set showbreak= | else | set showbreak=↪ | endif


" ╭-----------------╮
" ┆ Language        ┆
" ╰-----------------╯
"   └─ python
        au Filetype vim set autoindent expandtab ts=2 sts=2 sw=2
"   └─ vim
        au Filetype sh  set autoindent expandtab ts=2 sts=2 sw=2


" ╭-----------------╮
" ┆ Key-Map         ┆
" ╰-----------------╯
"   :'<,'>%!column -t
"   :'<,'>%!sort -f -k2
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
" nmap  c#          ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgN
" nmap  c*          /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``cgn
" nmap  d#          ?\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgN
" nmap  d*          /\<<C-r>=expand('<cword>')<CR>\>\C<CR>``dgn
nmap  gx          viW"ay:!open <C-R>a &<CR>
nmap  H           ^
nmap  J           <C-f>zz
nmap  K           <C-b>zz
nmap  L           $
nmap  U           <C-R>
nmap  zm          zM
nmap  zr          zR
" nmap  *           m`:keepjumps normal! *``<CR>
" nmap  N           Nzzzv
" nmap  n           nzzzv

vmap  /           y/\V<C-R>=escape(@",'/\')<CR><CR>N
vmap  <Leader>s   :update<CR>:edit<CR>
vmap  <S-Tab>     <gv
vmap  <Tab>       >gv
vmap  J           :m '>+1<CR>gv
vmap  K           :m '<-2<CR>gv
vmap  Y           "+ygv<Esc>


" ╭-----------------╮
" ┆ Vim-Plug        ┆
" ╰-----------------╯
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | exit | exit
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
  " Plug 'airblade/vim-gitgutter'
  " Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-rooter'
  Plug 'bps/vim-textobj-python'
  Plug 'chr4/nginx.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'cocopon/iceberg.vim'
  Plug 'ekalinin/Dockerfile.vim'
  " Plug 'haya14busa/is.vim'
  Plug 'hrsh7th/vim-eft'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'itchyny/vim-highlighturl'
  Plug 'jmcantrell/vim-virtualenv'
  Plug 'junegunn/vim-peekaboo'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-user'
  Plug 'luochen1990/rainbow'
  Plug 'mechatroner/rainbow_csv'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'qxxxb/vim-searchhi'
  Plug 'rhysd/conflict-marker.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'thinca/vim-localrc'
  Plug 'tpope/vim-commentary'
  Plug 'voldikss/vim-floaterm'
  Plug 'yggdroot/indentline'
  Plug 'osyo-manga/vim-anzu'
call plug#end()


" ╭-----------------╮
" ┆ Colorscheme     ┆
" ╰-----------------╯
set termguicolors
if has("gui_running")
  set guifont=FiraCode\ Nerd\ Font:h12
  set guioptions-=r
  set guioptions-=L
  set guioptions+=k
  set guioptions-=b
  set linespace=2
  set bg=dark
  colorscheme iceberg
  execute "source $HOME/.vim/conf/iceberg.vim"
endif


" ╭-----------------╮
" ┆ Configuration   ┆
" ╰-----------------╯
for p in g:plugs_order
  if p == "iceberg" && g:colors_name != "iceberg"
  else
    if p[-4:] == ".vim" | let p = p[:-5] | endif
    let p = "$HOME/.vim/conf/".p.".vim"
    if !empty(expand(glob(p))) | execute "source ".p | endif
  endif
endfor
