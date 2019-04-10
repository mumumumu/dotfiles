""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   Filename: init.vim                                                       "
" Maintainer: Jeff Mu <smartmu@gmail.com>                                    "
"        URL: http://github.com/mumumumu/dotfiles                            "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim: set foldenable, foldmethod=marker, foldlevel=0

" Change the mapleader from \ to ,
let mapleader=","

" =============================================================================
" Plugins {{{
" =============================================================================
call plug#begin('~/.vim/plugged')

" Display
Plug 'itchyny/lightline.vim'

" display indention levels with vertical lines
Plug 'Yggdroot/indentLine'
let vim_json_syntax_conceal=0

" auto close (X)HTML tags
Plug 'alvan/vim-closetag'

" perform all vim insert mode completions with Tab
Plug 'ervandew/supertab'

Plug 'godlygeek/tabular'                                          " :Tabularize
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'                                      " Preview register contents \" or @
Plug 'justinmk/vim-gtfo'                                          " go to current files directory got/gof
Plug 'Konfekt/FastFold'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'                                       " quickly comment out lines with gcc, gcap for paragraphs
Plug 'tpope/vim-surround'                                         " delete/change/add surrounding characters

" Git
Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'  " Display git log with :GV
" Plug 'junegunn/vim-xmark', { 'do': 'make' }  " Preview markdown w/ :XMark
Plug 'tpope/vim-fugitive'

Plug 'JamshedVesuna/vim-markdown-preview'
let vim_markdown_preview_github=1
let vim_markdown_preview_toggle=2

Plug 'tpope/vim-rhubarb'

" Python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'tmhedberg/SimpylFold'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

" JS
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'ianks/vim-tsx', { 'for': ['typescript.tsx'] }
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
" Plug 'mxw/vim-jsx', { 'for': ['javascript.jsx'] }
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

" Linting
Plug 'w0rp/ale'

" Language Server Protocol
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }

" Plug 'junegunn/goyo.vim'  " Do not disturb mode; activate using :Goyo
" Plug 'beloglazov/vim-online-thesaurus'
" Plug 'vim-scripts/ReplaceWithRegister'  " replace text w/ contents of a register
" Plug 'AndrewRadev/splitjoin.vim'  " switch single line statements to multi line (gS) and back (gJ)
"
call plug#end()

nnoremap <F5> :MundoToggle<CR>
set undofile
set undodir=~/.vim/undo

let g:python3_host_prog = expand('~/.virtualenvs/neovim/bin/python')

let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#jedi#show_docstring = 1
" let g:deoplete#sources = {}
" let g:deoplete#sources.python = ['LanguageClient']

let g:jedi#use_splits_not_buffers = "right"

map <C-n> :NERDTreeToggle<CR>

nnoremap <C-\> :TagbarToggle<CR>
let g:tagbar_iconchars = ['▸', '▾']

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabClosePreviewOnPopupClose = 1

let g:jsx_ext_required = 0  " allow jsx syntax highlighting in .js files

let g:closetag_filetypes = "html,javascript.jsx,typescript.tsx"

let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tsserver', 'tslint'],
\ }
let g:ale_fixers = {
    \ 'javascript': ['eslint'],
    \ 'typescript': ['tslint'],
\ }
let g:ale_fix_on_save = 1

" let g:LanguageClient_serverCommands = {
"     \ 'javascript': ['typescript-language-server', '--stdio'],
"     \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
"     \ 'python': ['pyls'],
"     \ 'typescript': ['typescript-language-server', '--stdio'],
"     \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
"     \ }
" let g:LanguageClient_rootMarkers = {
"     \ 'javascript': ['package.json'],
"     \ 'javascript.jsx': ['package.json'],
"     \ 'python': ['requirements.txt'],
"     \ 'typescript': ['package.json'],
"     \ 'typescript.tsx': ['package.json'],
"     \ }
" set hidden
" nnoremap <silent> <Leader>d :call LanguageClient_textDocument_definition()<CR>
" nnoremap <silent> <Leader>r :call LanguageClient_textDocument_rename()<CR>
" nnoremap <silent> <Leader>s :call LanguageClient_textDocument_references()<CR>
" nnoremap <silent> <Leader>w :call LanguageClient_textDocument_formatting()<CR>


" }}}
"
" =============================================================================
" Key Mappings {{{
" =============================================================================

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]

" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab

" Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.
set ofu=syntaxcomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme molokai       " set colorscheme

" Highlight characters that go over 80 columns
highlight ColorColumn ctermbg=black
set colorcolumn=120

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number                " show line numbers
set cul                   " highlight current line
set ignorecase            " make searches case-insensitive.
set smartcase             " searches become case-sensitive if multiple cases
set showmatch             " show matching braces when text indicator is over them
set scrolloff=10
set autochdir             " auto set current directory to directory of last opened file
set wildmode=longest,list " tab completion for files/buffers
set mouse+=a              " enable mouse mode (scrolling, selection, etc)
set splitbelow            " open new split panes to right and bottom
set splitright
set lazyredraw
set noshowmode

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set nowrap                " don't wrap text

autocmd BufWritePre * :%s/\s\+$//e  " trim trailing white space on save

" ----------------------------------------------------------------------------
" Tabs
" ----------------------------------------------------------------------------
nnoremap ]t :tabn<cr>
nnoremap [t :tabp<cr>

" ----------------------------------------------------------------------------
" <tab> / <s-tab> | Circular windows navigation
" ----------------------------------------------------------------------------
nnoremap <tab>   <c-w>w
nnoremap <S-tab> <c-w>W

" ----------------------------------------------------------------------------
" Buffers
" ----------------------------------------------------------------------------
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>

" FZF
map <Leader>b :Buffers<CR>
map <Leader>f :Files<CR>
map <Leader>g :GFiles<CR>
map <Leader>t :Tags<CR>

source $HOME/.vim/config/keys.vim
