let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \ }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R'
let g:fzf_layout = {
  \ 'up':'~90%',
  \ 'window': {
  \   'width': 0.9,
  \   'height': 0.9,
  \   'yoffset':0.5,
  \   'xoffset': 0.5,
  \   'border': 'sharp'
  \   }
  \ }
let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info --margin=1,1'

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --smart-case --no-heading --color=always --glob "!.git/**" '.shellescape(<q-args>),1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}), <bang>0)


nmap <silent> <C-f>     :Files<CR>
nmap <silent> <Leader>f :Rg<CR>
nmap <silent> <Leader>b :Buffers<CR>
nmap <silent> <Leader>w :Windows<CR>
nmap <silent> <Leader>' :FZFMarks<CR>
nmap <silent> <Leader>l :FZFBLines<CR>
nmap <silent> <Leader>H :Helptags<CR>
nmap <silent> <Leader>h :History<CR>
