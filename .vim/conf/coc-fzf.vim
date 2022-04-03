let g:coc_fzf_opts = ['--layout=reverse']
" allow to scroll in the preview
set mouse=a
" mappings
nmap <silent> <Leader>Coc      :<C-u>CocFzfList<CR>
nmap <silent> <Leader>caa      :<C-u>CocFzfList diagnostics<CR>
nmap <silent> <Leader>cab      :<C-u>CocFzfList diagnostics --current-buf<CR>
nmap <silent> <Leader>cc       :<C-u>CocFzfList commands<CR>
" nmap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
" nmap <silent> <space>l       :<C-u>CocFzfList location<CR>
nmap <silent> <Leader>co       :<C-u>CocFzfList outline<CR>
" nmap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
" nmap <silent> <space>p       :<C-u>CocFzfListResume<CR>

nmap <leader>gd :Gvdiffsplit!<CR>
nmap <leader>dh :diffget //2<CR>
nmap <leader>dl :diffget //3<CR>
let g:gitgutter_set_sign_backgrounds = 1
set signcolumn=yes
highlight! link SignColumn LineNr


function! s:setup_git_messenger_popup() abort
  " Your favorite configuration here
  " For example, set go back/forward history to <C-o>/<C-i>
  nmap <buffer><C-o> o
  nmap <buffer><C-i> O
endfunction
autocmd FileType gitmessengerpopup call <SID>setup_git_messenger_popup()
