set encoding=utf-8
scriptencoding utf-8
let mapleader="\<Space>"

" Make the VIM happen.
set nocompatible

filetype plugin on

" Prefer unix format for lines
set fileformats=unix,dos

" set term=linux
" set t_Co=256

set nospell

if v:version > 703
    " This makes copy and paste also work better.
    set clipboard=unnamedplus
endif

set showtabline=2
set laststatus=2
set history=50
set ruler

" Set backspaces
set backspace=indent,eol,start

set scrolloff=999

" Default to spaces instead of tabs
set expandtab

" Set tab width to 4.
set tabstop=4
set shiftwidth=4
" Setting this will make backspace delete space indents
set softtabstop=4

" Autoindent
set autoindent

" Make the relative path automatic.
set autochdir

" Put all special files in the right place
" set backupdir=$HOME/.cache/vim/.backup//
" set directory=$HOME/.cache/vim/.swp//

" Draw tabs and trailing spaces
set listchars=tab:>~
set list
" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc

" Automatically set the title to the full path.
set titlestring=%(\ %{expand(\"%:p\")}\ %a%)

" Use Blowfish for encryption, because it's awesome.
set cryptmethod=blowfish

" Enable persistent undo
" set undodir=$VIMHOME/.undo//
"set undofile
"set undolevels=1000 "maximum number of changes that can be undone
"set undoreload=10000 "maximum number lines to save for undo on a buffer reload

" Automatically re-open files after they have changed without prompting.
" This can be a little more destructive, but a lot less annoying.
set autoread

" Set the right margin.
"set colorcolumn=81
" Automatically split words at the margin.
set wrap

" Disable automatic wrapping.
set textwidth=0

" Make :Q and :W work like :q and :w
command! W w
command! Q q

" Make completion smarter.
set ignorecase
set smartcase

" viminfo settings
" '100 : Remember marks for 100 previously edited files.
" <50  : ???
" s10  : ???
" h    : ???
" "100 : Save 100 lines for each register
" :50  : Remember 50 lines of command history
set viminfo='100,<50,s10,h,\"100,:50

" Disable folding because it's annoying.
set nofoldenable

" Switch to the directory files are in automatically.
set autochdir

" Do not echo the mode, lightline will display it instead.
set noshowmode

set shortmess=filnxtToOc

" Find search matches as they are typed.
set incsearch

" Configure the delay for custom chained keybinds.
set timeoutlen=250
" Highlight the screen line of the cursor
" set cursorline

" --- NERDTree settings ---

" Close NERDTree automatically after opening a file with it.
let g:NERDTreeQuitOnOpen = 1
" Use a single click for opening things in NERDTree
let g:NERDTreeMouseMode = 3
let g:NERDTreeMapActivateNode = '<Space>'
let g:NERDTreeIgnore = [
\   '\.pyc$',
\   '^__pycache__$',
\]


" --- ALE settings ---
"
" Disable ALE warnings about trailing whitespace.
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_maximum_file_size = 1024 * 1024
let g:ale_completion_enabled = 0
let g:ale_set_balloons_legacy_echo = 1
let g:ale_c_parse_compile_commands = 1

" Options for different linters.
let g:ale_python_mypy_ignore_invalid_syntax = 1
let g:ale_python_mypy_options = '--incremental'
let g:ale_typescript_tslint_ignore_empty_files = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1

" Use newer clang versions where available.
if executable('clang-6.0')
    let g:ale_c_clang_executable = 'clang-6.0'
    let g:ale_cpp_clang_executable = 'clang-6.0'
endif

if executable('clangd-6.0')
    let g:ale_c_clangd_executable = 'clangd-6.0'
    let g:ale_cpp_clangd_executable = 'clangd-6.0'
endif


" ================
" install plug.vim
" ================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:project_root_markers = ['.root', '.project', '.cproject']

call plug#begin('~/.vim/plugged')

Plug 'tmux-plugins/vim-tmux'

Plug 'hecal3/vim-leader-guide'
Plug 'majutsushi/tagbar'
    let g:tagbar_width = 30
    "   autocmd FileType c,cpp nested :TagbarOpen
Plug 'chrisbra/unicode.vim'

" Plug 'itchyny/lightline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Auto generate tags
Plug 'ludovicchabant/vim-gutentags'
set statusline+=%{gutentags#statusline()}
let g:gutentags_add_default_project_roots = 0
let g:gutentags_project_root = g:project_root_markers
let g:gutentags_ctags_tagfile = 'tag'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
" let g:gutentags_trace = 1
let g:gutentags_modules = []
if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

" comment
Plug 'scrooloose/nerdcommenter'
nmap <leader>cc  <plug>NERDCommenterToggle 

" auto complete
Plug 'shougo/deoplete.nvim'
" Plug 'tbodt/deoplete-tabnine', {'do': './install.sh' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
let g:deoplete#enable_at_startup = 1


Plug 'w0rp/ale'



" Plug 'mhinz/vim-signify'
" let g:signify_vcs_list = [ 'git' ]
Plug 'airblade/vim-gitgutter'
nmap <F7> :GitGutterToggle<CR>

" tree explorer plugin
Plug 'scrooloose/nerdtree'
Plug 'justinmk/vim-dirvish'
Plug 'octol/vim-cpp-enhanced-highlight'

if executable('fzf')
    Plug 'junegunn/fzf.vim'
else
    Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_by_filename = 1
    let g:ctrlp_root_markers = g:project_root_markers
    let g:ctrlp_custom_ignore = {
                \ 'dir': 'v[\/]\.(git|hg|svn)$',
                \ 'file': '\v\.(exe|so|dll|o|d)$',
                \ }
endif

if executable('rustc')
    Plug 'rust-lang/rust.vim', { 'for': 'rust' }
    Plug 'racer-rust/vim-racer', { 'for': 'rust' }
endif

" Plug 'ianva/vim-youdao-translater'
"   vnoremap <silent> <C-T> :<C-u>Ydv<CR>
"   nnoremap <silent> <C-T> :<C-u>Ydc<CR>
"   noremap <leader>yd :<C-u>Yde<CR>

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-fugitive'

" Plug 'bling/vim-bufferline'
Plug 'wesQ3/vim-windowswap'

Plug 'ervandew/supertab'

Plug 'mkitt/tabline.vim'

" Plug 'liuchengxu/vim-which-key'

Plug 'ryanoasis/vim-devicons'

Plug 'fcangialosi/bootlin.vim'

Plug 'itchyny/vim-cursorword'

Plug 'lfv89/vim-interestingwords'



Plug  'vim-scripts/DoxygenToolkit.vim'
call plug#end()

syntax on 
filetype on
" set relativenumber
set nu

" Show the current command at the bottom
set showcmd

set updatetime=100

let mapleader = ','
let maplocalleader = '\'
let g:bootlin_version = "4.19.1"

nmap <F8> :TagbarToggle<CR>
nmap <F2> :NERDTreeToggle<CR>
"nmap <F3> :edit ~/.vimrc<CR>
"nmap <F12> :source %<CR>
