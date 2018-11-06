syntax on 
color dracula

if !has('gui_running')
  set t_Co=256
endif

set nowrap

noremap <F3> :set invnumber<CR>
inoremap <F3> <C-O>:set invnumber<CR>

noremap <F2> :GitGutterAll<CR>

noremap <leader>`` :VimTodoListsCreateNewItem<CR>
noremap <leader>`1 :VimTodoListsCreateNewItemBelow<CR>
noremap <leader>` :VimTodoListsToggleItem<CR>

noremap <leader>q :q<CR>

noremap <leader>a `a

" mappings for select All
noremap zp ggvG$

let g:user_emmet_leader_key=','

set mouse=n
set ttymouse=xterm2

set nu
set rnu

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

" ale lint
let b:ale_linters = ['eslint']
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 'never'

let g:airline#extensions#ale#enabled = 1

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}

augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
