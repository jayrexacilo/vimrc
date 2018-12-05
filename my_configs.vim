syntax on
color dracula

if !has('gui_running')
  set t_Co=256
endif

set nowrap

let NERDTreeQuitOnOpen = 1
let g:gitgutter_enabled = 1

" Surround the visual selection
vnoremap $( <esc>`>a)<esc>`<i(<esc>
vnoremap $[ <esc>`>a]<esc>`<i[<esc>
vnoremap ${ <esc>`>a}<esc>`<i{<esc>
vnoremap $" <esc>`>a"<esc>`<i"<esc>
vnoremap $' <esc>`>a'<esc>`<i'<esc>
vnoremap $` <esc>`>a`<esc>`<i`<esc>

" mappings for fugitive
noremap [q :cnext<CR>
noremap ]q :cprev<CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gr :Gread
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>gg :Ggrep<Space>
nnoremap <space>gpp :Gpush<CR>
nnoremap <space>gp :Gpull
nnoremap <space>gm :Gcommit -m ''<Left>
nnoremap <space>gam :Gcommit -am ''<Left>

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

" mappings for open foldings
noremap zpo ggvG$zO

let g:user_emmet_leader_key=','

set mouse=n
set ttymouse=xterm2

set nu
set rnu

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
"                 ale lint for reactjs
"""""""""""""""""""""""""""""""""""""""""""""""""""
" let b:ale_linters = ['eslint']
" let b:ale_fixers = ['prettier', 'eslint']
let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_error = '●' " Less aggressive than the default '>>'
" let g:ale_linters_ignore = {'typescript': ['tslint']}
" let g:typescript_compiler_binary = 'tsc'

set statusline=%{LinterStatus()}

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

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}

let g:ale_linters = {
\   'javascript': ['eslint']
\}

let g:ale_pattern_options = {
  \   '\.js$': {
  \       'ale_linters': ['eslint'],
  \       'ale_fixers': ['eslint'],
  \   },
  \}

nmap <silent> <C-j> :ALENext<cr>
nmap <silent> <C-k> :ALEPrevious<cr>
nnoremap <space>w :TsuQuickFix <CR>y<CR>
