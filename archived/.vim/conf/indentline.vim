let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceqqallevel = 2

autocmd VimEnter * if bufname('%') == '' | IndentLinesDisable | endif
