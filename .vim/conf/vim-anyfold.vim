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


" " activate anyfold by default
" augroup anyfold
"     autocmd!
"     autocmd Filetype python AnyFoldActivate
" augroup END

" " disable anyfold for large files
" let g:LargeFile = 1000 " file is large if size greater than 1MB
" autocmd BufReadPre,BufRead * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
" function LargeFile()
"     augroup anyfold
"         autocmd! " remove AnyFoldActivate
"         autocmd Filetype python setlocal foldmethod=indent " fall back to indent folding
"     augroup END
" endfunction

nmap <silent> z1 :%foldclose<cr>
nmap <silent> z2 :call <sid>CloseFoldOpens(2)<cr>
nmap <silent> z3 :call <sid>CloseFoldOpens(3)<cr>
nmap <silent> z4 :call <sid>CloseFoldOpens(4)<cr>
nmap <silent> z5 :call <sid>CloseFoldOpens(5)<cr>
nmap <silent> z6 :call <sid>CloseFoldOpens(6)<cr>
nmap <silent> z7 :call <sid>CloseFoldOpens(7)<cr>
nmap <silent> z8 :call <sid>CloseFoldOpens(8)<cr>
nmap <silent> z9 :call <sid>CloseFoldOpens(9)<cr
