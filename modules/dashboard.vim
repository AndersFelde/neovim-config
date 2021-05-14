let g:dashboard_default_executive ='fzf'

" nnoremap <silent> <leader>sl :Files <CR>
nnoremap <silent> <leader>fh :DashboardFindHistory <CR>
nnoremap <silent> <leader>ff :DashboardFindFile <CR>
nnoremap <silent> <leader>fw :DashboardFindWord <CR>
nnoremap <silent> <leader>fb :DashboardJumpMarks <CR>
nnoremap <silent> <leader>nf :DashboardNewFile <CR>
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>

let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC n f',
\ 'change_colorscheme' : 'SPC t c',
\ 'find_word'          : 'SPC f w',
\ 'book_marks'         : 'SPC f b',
\ }
