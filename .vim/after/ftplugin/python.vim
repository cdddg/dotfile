function! CustomFoldText()
  let l:fs = v:foldstart
  while getline(l:fs) =~ '^\s*$' | let l:fs = nextnonblank(l:fs + 1)
  endwhile
  if l:fs > v:foldend
    let l:line = getline(v:foldstart)
  else
    let l:line = substitute(getline(l:fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let l:markexpr = escape(substitute(&foldmarker, ',', '|', 'g'),'{')
  let l:whitespace = '(\w\s*)?["|#]\s*|\s*$'
  let l:strip_line = substitute(l:line, '\v'.l:markexpr.'|'.l:whitespace, '', 'g')
  let l:strip_line = substitute(l:strip_line, '\v'.l:whitespace, '', 'g')
  let l:strip_line = substitute(l:strip_line, '\v^(\s*)', '\1', '').''
  let l:w = winwidth(0) - &foldcolumn - (&number ? 3 : 0)
  let l:foldSize = 1 + v:foldend - v:foldstart
  let l:foldSizeStr = ' ' . l:foldSize . ' lines '
  let l:foldLevelStr = ' '
  let l:lineCount = line('$')
  let l:foldPercentage = printf('[%.1f', (l:foldSize*1.0)/l:lineCount*100) . '%] '
  let l:expansionString = repeat(' ', l:w - strwidth(l:foldSizeStr.strip_line.foldLevelStr.foldPercentage))
  return l:strip_line . l:expansionString . l:foldSizeStr . l:foldPercentage
endfunction

set foldtext=CustomFoldText()
imap PP  from pprint import pprint
