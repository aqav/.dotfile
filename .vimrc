call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
let g:gruvbox_invert_selection=0

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1

Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'gruvbox'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
            \ 'coc-git',
            \ 'coc-java', 
            \ 'coc-pairs',
            \ 'coc-snippets',
            \ 'coc-yank'
            \ ]

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-Tab>'

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

call plug#end()

set nocompatible
set nowrap
set hidden
set lazyredraw
set scrolloff=8
set backspace=indent,start,eol
set fileformats=unix,dos,mac

set visualbell
set t_vb=

set t_Co=256
syntax enable
colorscheme gruvbox
set background=dark

set number
set relativenumber
set signcolumn=yes

set ruler
set wildmenu
set showcmd
set showmode
set showmatch
set matchtime=1
set cursorline
set display=lastline
set showtabline=2
set laststatus=2
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<

set splitright
set splitbelow

set ignorecase
set smartcase
set hlsearch
set incsearch

set cindent
set autoindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4
filetype plugin indent on

set ttimeout
if $TMUX != ''
    set ttimeoutlen=30
else
    set ttimeoutlen=50
endif

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1

set foldenable
set foldmethod=indent
set foldlevel=99
set foldcolumn=0

autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \        exe "normal! g`\"" |
        \ endif

silent! call mkdir(expand('~/.vim/temp/backup'), "p", 0755)
silent! call mkdir(expand('~/.vim/temp/swap'), "p", 0755)
silent! call mkdir(expand('~/.vim/temp/undo'), "p", 0755)
set backupdir=~/.vim/temp/backup
set directory=~/.vim/temp/swap
set undodir=~/.vim/temp/undo
set backup
set writebackup
set swapfile
set undofile

inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>

inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-d> <del>
