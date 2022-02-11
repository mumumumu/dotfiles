call plug#begin('~/.config/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" tags
Plug 'ludovicchabant/vim-gutentags'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" python
Plug 'psf/black', { 'branch': 'stable' }

" typescript
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" terraform
Plug 'hashivim/vim-terraform'

" salesforce
Plug 'ejholmes/vim-forcedotcom'

call plug#end()

" persistent undo
set undofile
set undodir=$HOME/.config/nvim/undo

" visual goodies
set number      " show line numbers
set cul         " highlight current line
set noshowmode  " hide insert mode, redundant with lightline
set updatetime=100  " time (ms) between writing updates to swp file
set cc=120

set autochdir   " auto set current directory to directory of last opened file
set ignorecase  " make search case-insensitive
set smartcase   " search becomes case-sensitive if multiple cases
set showmatch   " show matching braces when cursor is over them
set splitbelow  " open new split panes to bottom and right
set splitright

set expandtab      " use spaces instead of tabs
set shiftround	   " always indent/outdent to the nearest tabstop
set shiftwidth=4   " indent/outdent by 4 columns
set softtabstop=4

set mouse=a  " enable mouse scrolling in vim
set clipboard+=unnamedplus

autocmd FileType javascript,typescript,yaml,sh setlocal ts=2 sw=2 sts=2 expandtab
autocmd BufNewFile,BufRead *.tsx set filetype=typescript

autocmd BufWritePre * :%s/\s\+$//e  " trim trailing white space on save

" remap leader
let mapleader=','

" file explorer
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle = 3
nnoremap <leader>n :Lexplore<CR>

" remove search highlight
nnoremap <leader>q :noh<CR>

" python
let g:python3_host_prog = expand('~/.pyenv/versions/neovim3/bin/python')

" autocomplete
let g:deoplete#enable_at_startup = 1

"autoclose tags
inoremap ( ()<Left>
inoremap { {}<Left>
inoremap [ []<Left>
inoremap ' ''<Left>
inoremap " ""<Left>

let g:gutentags_enabled = 0
let g:gutentags_cache_dir = expand('~/.config/nvim/tags/')

" key bindings
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap <tab>   :tabn<cr>
nnoremap <S-tab> :tabp<cr>
map <Leader>b :Buffers<CR>
map <Leader>f :Files<CR>
