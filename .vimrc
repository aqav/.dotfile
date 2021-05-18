set nocompatible
set backspace=eol,start,indent
set autoindent
set ruler
set nowrap
set scrolloff=8
set visualbell
set t_vb=

set number
set relativenumber

set showmatch
set matchtime=2
set display=lastline
set wildmenu
set lazyredraw
set list
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
set formatoptions+=m
set formatoptions+=B
set fileformats=unix,dos,mac

set ignorecase
set smartcase
set hlsearch
set incsearch

set showcmd
set showmode
set splitright

set cindent
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

set laststatus=2
" set showtabline=2
set signcolumn=yes
set t_Co=256

set ttimeout
set ttimeoutlen=50
if $TMUX != ''
    set ttimeoutlen=30
elseif &ttimeoutlen > 80 || &ttimeoutlen <= 0
    set ttimeoutlen=80
endif

if has('multi_byte')
    set encoding=utf-8
    set fileencoding=utf-8
    set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
endif

if has('autocmd')
    filetype plugin indent on
endif

if has('syntax')
    syntax enable
    syntax on
endif

if has('folding')
    set foldenable
    set fdm=indent
    set foldlevel=99
endif

set suffixes=.bak,~,.o,.h,.info,.swp,.obj,.pyc,.pyo,.egg-info,.class
set wildignore=*.o,*.obj,*~,*.exe,*.a,*.pdb,*.lib
set wildignore+=*.so,*.dll,*.swp,*.egg,*.jar,*.class,*.pyc,*.pyo,*.bin,*.dex
set wildignore+=*.zip,*.7z,*.rar,*.gz,*.tar,*.gzip,*.bz2,*.tgz,*.xz
set wildignore+=*DS_Store*,*.ipch
set wildignore+=*.gem
set wildignore+=*.png,*.jpg,*.gif,*.bmp,*.tga,*.pcx,*.ppm,*.img,*.iso
set wildignore+=*.so,*.swp,*.zip,*/.Trash/**,*.pdf,*.dmg,*/.rbenv/**
set wildignore+=*/.nx/**,*.app,*.git,.git
set wildignore+=*.wav,*.mp3,*.ogg,*.pcm
set wildignore+=*.mht,*.suo,*.sdf,*.jnlp
set wildignore+=*.chm,*.epub,*.pdf,*.mobi,*.ttf
set wildignore+=*.mp4,*.avi,*.flv,*.mov,*.mkv,*.swf,*.swc
set wildignore+=*.ppt,*.pptx,*.docx,*.xlt,*.xls,*.xlsx,*.odt,*.wps
set wildignore+=*.msi,*.crx,*.deb,*.vfd,*.apk,*.ipa,*.bin,*.msu
set wildignore+=*.gba,*.sfc,*.078,*.nds,*.smd,*.smc
set wildignore+=*.linux2,*.win32,*.darwin,*.freebsd,*.linux,*.android

if &term =~ '256color' && $TMUX != ''
    set t_ut=
endif

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

autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") |
        \        exe "normal! g`\"" |
        \ endif

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

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline-themes'

" Plug 'yuttie/hydrangea-vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
 Plug 'agude/vim-eldar'
" Plug 'liuchengxu/space-vim-theme'
" Plug 'shaunsingh/moonlight.nvim'
" Plug 'chriskempson/base16-vim'
Plug 'kenwheeler/glow-in-the-dark-gucci-shark-bites-vim'
Plug 'dracula/vim', { 'name': 'dracula' }
Plug 'bignimbus/pop-punk.vim'
" Plug 'ryanoasis/vim-devicons'
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
call plug#end()

let g:fzf_preview_window = ['right:50%:border-none']

let g:airline#extensions#tabline#enabled = 1
" let g:airline_theme='murmur'

" colorscheme eldar
"
" colorscheme dracula

" colorscheme pop-punk
" colorscheme molokai
" colorscheme PaperColor
colorscheme gruvbox
set background=dark

" pop-punk ANSI colors for vim terminal
let g:terminal_ansi_colors = pop_punk#AnsiColors()

" for the airline theme - note the underscore instead of the hyphen
" let g:airline_theme = 'pop_punk'
" let g:airline_theme = 'molokai'
" let g:airline_theme='papercolor'
let g:airline_theme='gruvbox'

" just for fun
let g:airline_section_c = ' %F'
