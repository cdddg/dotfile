set guioptions-=e
set showtabline=2
set laststatus=2
set noshowmode

let g:lightline = {
\   'colorscheme': 'iceberg',
\   'active': {
\       'left': [
\           [ 'mode', 'paste' ],
\           [ 'gitbranch', 'readonly', 'filename', 'modified' ],
\       ],
\       'right': [
\           [ 'lineinfo' ],
\           [ 'percent' ],
\           [ 'filetype', 'fileformat', 'fileencoding' ],
\       ]
\   },
\   'tabline': {
\       'right': [['gitbranch']]
\   },
\   'component_function': {
\       'gitbranch': 'gitbranch#name',
\       'mode': 'LightlineMode',
\       'readonly': 'LightlineReadonly',
\       'lineinfo': 'LightlineLineinfo',
\       'percent': 'LightlinePercent',
\       'filetype': 'LightlineFiletype',
\       'fileformat': 'LightlineFileformat',
\       'fileencoding': 'LightlineFileencoding',
\   },
\}
"

" itchyny/lightline.vim {{{
" let g:lightline = {
" \   'colorscheme': 'iceberg',
" \   'active': {
" \    'left' :[[ 'mode', 'paste' ],
" \             [ 'readonly', 'filename', 'modified' ]],
" \    'right':[[ 'filetype', 'percent', 'lineinfo' ], [ 'cocstatus' ]]
" \   },
" \   'tabline': {
" \     'left': [['explorer_pad'], ['buffers']],
" \     'right': [['gitbranch', 'smarttabs']]
" \   },
" \   'separator': {
" \     'left': '', 'right': ''
" \   },
" \   'subseparator': {
" \     'left': '', 'right': ''
" \   },
" \   'component_raw': {
" \     'buffers': 1
" \   },
" \   'component_function': {
" \     'explorer_pad': 'lightline#explorer_pad#left_pad',
" \     'percent': 'LightlinePercent',
" \     'lineinfo': 'LightlineLineinfo',
" \     'filename': 'LightlineFilename',
" \     'fullname': 'LightlineFullname',
" \     'mode': 'LightlineMode',
" \     'gitbranch': 'gitbranch#name',
" \     'readonly': 'LightlineReadonly',
" \     'modified': 'LightlineModified',
" \     'filetype': 'LightlineFiletype',
" \     'cocstatus': 'LightlineCoc',
" \   },
" \   'component_expand': {
" \     'buffers': 'lightline#bufferline#buffers',
" \     'smarttabs': 'SmartTabsIndicator',
" \     'trailing': 'lightline#trailing_whitespace#component'
" \   },
" \   'component_type': {
" \     'buffers': 'tabsel',
" \     'trailing': 'warning'
" \   }
" \}

function! s:trim(maxlen, str) abort
    let trimed = len(a:str) > a:maxlen ? a:str[0:a:maxlen] . '..' : a:str
    return trimed
endfunction

function! s:is_narrow_window() abort
    let l:items = [ 'nerdtree' ]
    if winwidth(0) < 60 & index(&filetype, l:items) != -1:
        return 1
    else:
        return 0
    endif
endfunction


function! LightlinePercent() abort
    if winwidth(0) < 60
        return ''
    endif

    return ' ' . line('.') * 100 / line('$') . '% '
endfunction

function! LightlineLineinfo() abort
    if winwidth(0) < 60
        return ''
    endif
    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

function! LightlineFilename() abort
    let l:prefix = expand('%:p') =~? "fugitive://" ? '(fugitive) ' : ''
    let l:maxlen = winwidth(0) - winwidth(0) / 2
    let l:relative = expand('%:.')
    let l:tail = expand('%:t')
    let l:noname = 'No Name'

    if winwidth(0) < 50
        return ''
    endif

    if winwidth(0) < 86
        return l:tail ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:tail)
    endif

    return l:relative ==# '' ? l:noname : l:prefix . s:trim(l:maxlen, l:relative)
endfunction

function! LightlineFullname() abort
    return expand('%')
endfunction

function! LightlineModified() abort
    return &modified ? '●' : ''
endfunction

function! LightlineMode() abort
    let ftmap = {
    \ 'nerdtree': 'NERETREE',
    \ }
    return get(ftmap, &filetype, lightline#mode())
endfunction

function! LightlineReadonly() abort
    let ftmap = {
    \ 'nerdtree': '',
    \ }
    return &readonly ? get(ftmap, &filetype, '') : ''
endfunction

function! LightlineGitbranch() abort
    if exists('*fugitive#head')
        let maxlen = 20
        let branch = fugitive#head()
        return branch !=# '' ? ' '. s:trim(maxlen, branch) : ''
    endif
    return fugitive#head()
endfunction

function! LightlineFiletype() abort
    let l:icon = WebDevIconsGetFileTypeSymbol()
    return winwidth(0) > 86 ? (strlen(&filetype) ? &filetype . ' ' . l:icon : l:icon) : ''
endfunction

function! LightlineFileformat() abort
    return winwidth(0) > 60 ? &fileformat : ''
endfunction

function! LightlineFileencoding() abort
    return winwidth(0) > 60 ? &fileencoding : ''
endfunction


" function! LightlinePercent() abort
"     return winwidth(0) > 60 ? ' ' . line('.') * 100 / line('$') . '% '
" endfunction


function! String2()
    return 'BUFFERS'
endfunction

function! SmartTabsIndicator() abort
    let tabs = lightline#tab#tabnum(tabpagenr())
    let tab_total = tabpagenr('$')
    return tabpagenr('$') > 1 ? ('TABS ' . tabs . '/' . tab_total) : ''
endfunction

" autoreload
command! LightlineReload call LightlineReload()

function! LightlineReload() abort
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction

let g:lightline#trailing_whitespace#indicator = ''
" }}}
