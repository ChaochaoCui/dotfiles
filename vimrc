" Vim Base Settings {{{
set nocompatible

" show the current command at the bottom
set showcmd

let mapleader = " "

inoremap jk <esc>
inoremap <esc> <nop>

noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

noremap <leader>g :grep! -R '<cword>' .<cr>
noremap <leader>] :tj<cr>

set number
set foldmethod=marker

syntax on
filetype plugin indent on
" }}}

" vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'

"Plug 'ludovicchabant/vim-gutentags'
"set statusline+=%{gutentags#statusline()}
"Plug 'skywind3000/gutentags_plus'

Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

call plug#end()
" }}}

" editorconfig-vim {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*']
" }}}

" gutentags {{{
" let g:gutentags_dont_load = 1
let g:gutentags_debug = 1
let g:gutentags_enabled = 1
let g:gutentags_modules = ['ctags', 'gtags_cscope']
let g:gutentags_add_ctrlp_root_markers = 1
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = ['.root', '.project', '.cproject']
" }}}

" gutentags_plus {{{
let g:gutentags_plus_switch = 1
" }}}

" tagbar {{{
noremap <F8> :TagbarToggle<cr>
" }}}

" nerdtree {{{
noremap <F2> :NERDTreeToggle<cr>
autocmd vimenter * NERDTree
" }}}
