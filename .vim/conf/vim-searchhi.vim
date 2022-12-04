nmap n <Plug>(searchhi-n)
nmap N <Plug>(searchhi-N)
nmap * <Plug>(searchhi-*)
nmap # <Plug>(searchhi-#)
nmap / <Plug>(searchhi-/)
nmap ? <Plug>(searchhi-?)
nmap <silent> <C-L> <Plug>(searchhi-clear-all)

vmap n <Plug>(searchhi-v-n)
vmap N <Plug>(searchhi-v-N)
vmap * <Plug>(searchhi-v-*)
vmap # <Plug>(searchhi-v-#)
vmap / <Plug>(searchhi-v-/)
vmap ? <Plug>(searchhi-v-?)
vmap <silent> <C-L> <Plug>(searchhi-v-clear-all)


let g:searchhi_user_autocmds_enabled = 1
let g:searchhi_redraw_before_on = 1

augroup searchhi
    autocmd!
    autocmd User SearchHiOn AnzuUpdateSearchStatusOutput
    autocmd User SearchHiOff echo g:anzu_no_match_word
augroup END


let g:searchhi_clear_all_autocmds = 'InsertEnter'
let g:searchhi_update_all_autocmds = 'InsertLeave'
" let g:searchhi_clear_all_asap = 1


