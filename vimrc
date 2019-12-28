" Vim Base Settings {{{
set nocompatible

set clipboard=unnamedplus

" show the current command at the bottom
set showcmd

let mapleader = " "
set timeoutlen=250

inoremap jk <esc>
inoremap <esc> <nop>

noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source $MYVIMRC<cr>

noremap <leader>g :grep! -R '<cword>' .<cr>
noremap <leader>] :tj<cr>


set autoindent
" automatically read file when changed outside of vim
set autoread
" automatically write file if changed
set background=dark
set backspace=indent,eol,start
set cursorline
set encoding=utf-8
set expandtab
set fileformats=unix,dos
set foldmethod=marker
set foldclose=all
" set foldcolumn=2
set history=50
set hlsearch
set icon
set ignorecase
set keywordprg=man
set number
set numberwidth=4
set nopaste
set ruler
set smartindent
set wrap

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
Plug 'vim-scripts/a.vim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
   Plug 'Shougo/deoplete.nvim'
   Plug 'roxma/nvim-yarp'
   Plug 'roxma/vim-hug-neovim-rpc'
endif

" show a git diff in the 'gutter' (sign column)
Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

"Plug 'dense-analysis/ale'


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Plug 'liuchengxu/vim-which-key'
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
let g:gutentags_add_ctrlp_root_markers = 0
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
" autocmd vimenter * NERDTree
" }}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" ALE (Asynchronous Lint Engine)


" vim-airline {{{
"let g:airline_theme='simple'
let g:airline#extension#tabline#enabled = 1
" }}}

" *********Keymaps*********
" <leader>cs Find symbol(reference) under cursor
" <leader>cg Find symbol definition under cursor
" <leader>cd Functions called by this function
" <leader>cc Functions calling this function
" <leader>ct Find text string under cursor
" <leader>ce Find egrep pattern under cursor
" <leader>cf Find file name under cursor
" <leader>ci Find files #including the file name under cursor
