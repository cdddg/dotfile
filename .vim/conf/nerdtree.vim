let NERDTreeIgnore= [
  \ '.DS_Store',
  \ '__pycache__',
  \ '\.pyc$',
  \ '\.pytest_cache',
  \ '\.git$',
  \ '\$.db',
  \ '.venv',
  \ ]
let g:netrw_list_hide = ".DS_Store,__pycache__,\.pyc$,.pytest_cache,\.git,\$.db,.venv"
let NERDTreeShowHidden = 1


function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

function! ToggleNerdTree()
  set eventignore=BufEnter
  NERDTreeToggle
  set eventignore=
endfunction

au BufEnter * call SyncTree()
nmap  <Space>\  :call ToggleNerdTree()<CR>
