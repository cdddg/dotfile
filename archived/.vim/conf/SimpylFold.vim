autocmd FileType python setlocal foldlevelstart=-1
autocmd FileType python nmap <silent> z1 :%foldclose<cr>
autocmd FileType python nmap <silent> z2 :call <sid>CloseFoldOpens(2)<cr>
autocmd FileType python nmap <silent> z3 :call <sid>CloseFoldOpens(3)<cr>
autocmd FileType python nmap <silent> z4 :call <sid>CloseFoldOpens(4)<cr>
autocmd FileType python nmap <silent> z5 :call <sid>CloseFoldOpens(5)<cr>
autocmd FileType python let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

nmap <silent> <Leader>be :mksession! ~/.vim/session.vim<CR> :bufdo edit<CR> :source ~/.vim/session.vim<CR>

let g:SimpylFold_docstring_preview=1
let b:SimpylFold_docstring_preview=1
let g:SimpylFold_fold_import=0
let b:SimpylFold_fold_import=0

function! <sid>CloseFoldOpens(opens_level)
  let lineno = 4
  let last = line("$")
  while lineno < last
    if foldclosed(lineno) != -1
      let lineno = foldclosedend(lineno) + 1
    elseif foldlevel(lineno) == a:opens_level
        execute lineno."foldclose"
        let lineno = foldclosedend(lineno) + 1
    else
        let lineno = lineno + 1
    end
  endwhile
endfunction

