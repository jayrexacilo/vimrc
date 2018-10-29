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

let g:user_emmet_leader_key=','

set mouse=n
set ttymouse=xterm2
