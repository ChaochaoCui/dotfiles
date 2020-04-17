" Vim Base Settings {{{
set nocompatible

set clipboard=unnamedplus

" show the current command at the bottom
set showcmd
set cmdheight=2

let mapleader = ","
" set timeoutlen=250

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
set helplang=cn
set fileencodings=utf-8,ucs-bom,gbk,cp936,gb2312,gb18030
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
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

syntax enable
syntax on
filetype on
filetype plugin indent on

set nobackup
set noswapfile
set autoread
set autowrite
set confirm
" }}}

" vim-plug {{{
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/local_vimrc'

Plug 'Shougo/denite.nvim'

Plug 'mhinz/vim-startify'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/a.vim'

Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'

Plug 'majutsushi/tagbar'

Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
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

" find
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" grep
Plug 'mileszs/ack.vim'

Plug 'dense-analysis/ale'

Plug 'chxuan/cpp-mode'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ryanoasis/vim-devicons'

"Plug 'liuchengxu/vim-which-key'
call plug#end()
" }}}

" local_vimrc {{{
let g:local_vimrc = [ '.root' ]
let g:local_vimrc_options = get(g:, 'local_vimrc_options', {})
let g:local_vimrc_options.whitelist = [ '.root' ]
" call lh#local_vimrc#munge('whitelist', $HOME.'/codehub/linux/')
" }}}
"
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
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1
let g:NERDTreeHighlightFoldersFullName = 1
let g:NERDTreeDirArrowExpandable = '▷'
let g:NERDTreeDirArrowCollapsible = '▼'
let g:NERDTreeIgnore = ['.git', '.svn', '\.o$[[file]]', '\~$', '\.vim$']
let g:NERDTreeQuitOnOpen = 3
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeShowLineNumbers = 1
" autocmd vimenter * NERDTree
" }}}

" nerdtree-git-plugin {{{
let g:NERDTreeIndicatiorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "=",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Ingored"   : '☒',
            \ "Unknown"   : "?",
            \ }
"}}}

" deoplete {{{
let g:deoplete#enable_at_startup = 1
" }}}

" ALE (Asynchronous Lint Engine) {{{
" }}}

" vim-airline {{{
let g:airline_theme = 'onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
" }}}

" find, CtrlP, LeaderF {{{
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_RootMarkers = ['.root']
" }}}

" grep, ack, ag {{{
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif
nnoremap <leader>F :Ack!<space>
" }}}

" cpp-mode {{{
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
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
"


