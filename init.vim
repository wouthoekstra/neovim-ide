syntax on

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'pangloss/vim-javascript'
Plug 'crusoexia/vim-javascript-lib'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'
Plug 'kaicataldo/material.vim'
Plug 'enricobacis/vim-airline-clock'
Plug 'tpope/vim-surround'
Plug 'ncm2/ncm2'
Plug 'phpactor/phpactor'
Plug 'phpactor/ncm2-phpactor'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Key mappings
let g:mapleader=" "
nnoremap <Leader>/ :Ag<CR>
nnoremap <Leader><c-l> :call fzf#vim#buffer_lines(expand('<cword>'))<CR>
nnoremap <Leader><c-L> :call fzf#vim#lines(expand('<cword>'))<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>L :Lines<CR>
nnoremap <Leader>w :Windows<CR>

" Theme stuff
let g:one_allow_italics = 1 " I love italic for comments
set termguicolors
 " Material theme
colorscheme material
set background=dark
let g:material_theme_style = 'default'
let g:airline_theme = 'material'

" IDE preferences
set number
set tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab
set relativenumber
set nowrap
set ttyfast

" ale configuration
let g:airline#extensions#ale#enabled = 1
" Use a slightly slimmer error pointer
hi ALEErrorSign guifg=#DF8C8C
hi ALEWarningSign guifg=#F2C38F
" global language specifics
let g:ale_php_phpcs_standard='PSR2'
let g:ale_php_phpcbf_standard='PSR2'
" let g:ale_php_phpcs_standard='phpcs.xml.dist'
let g:ale_php_phpmd_ruleset='phpmd.xml'
" let g:ale_linters = {
"   \ 'php': ['phpcs', 'php']
"   \}
" let g:ale_fixers = {
"   \ '*': ['remove_trailing_lines', 'trim_whitespace'],
"   \ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
"   \}

" ctrlp configuration
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" clock configuration
let g:airline#extensions#clock#format = '%H:%M:%S'
let g:airline#extensions#clock#updatetime = 1000

" PHP workflow

if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
