runtime plugins.vim

packadd termdebug
set number relativenumber
autocmd vimenter * NERDTree 
"call deoplete#enable() "let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

" sets arrows be able to change lines
" set whichwrap+=<,>,[,]

let NERDTreeShowHidden=1
autocmd BufWinEnter * silent! NERDTreeMirror

imap <buffer> <M-Left> <C-o>b
imap <buffer> <M-Right> <C-o>ew
nmap <buffer> <M-Left> <C-o>b
nmap <buffer> <M-Right> <C-o>ew

runtime file_type.vim
