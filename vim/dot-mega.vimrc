" YCM

" " YCM goto fun
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>hd :YcmCompleter GoToDefinition<CR>

" Set YCM Interpreter
let g:ycm_server_python_interpreter="python3"

" make YCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
