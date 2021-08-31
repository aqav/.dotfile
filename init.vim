" ln -s ~/.dotfile/init.vim ~/.config/nvim/init.vim

" plugin
call plug#begin(stdpath('data') . '/plugged')
" distinguishable, contrast colorscheme and still pleasant for the eyes
Plug 'morhetz/gruvbox'
" let g:gruvbox_contrast_dark = 'hard'    " more constrast in dark mode

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1    " display all buffers when there're only one tab

" efficient fuzzy finder that helps to locate something
"
" require python2 or python3 command available in path:
" # sudo pacman -S python3
"
" for NeoVim:
" # sudo pacman -S python-pip
" # python3 -m pip install --user --upgrade pynvim
"
" for better performance:
" :LeaderfInstallCExtension
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
" common
" I don't like these separators
let g:Lf_StlSeparator ={
            \'left': '', 
            \'right': ''
            \}
let g:Lf_ShowDevIcons = 0                       " I don't like these icons
let g:Lf_PreviewInPopup = 1                     " always preview the result in a popup window rather than buffer
let g:Lf_PreviewCode = 1                        " preview the code rather than tag file when navigating the tags
let g:Lf_ShowHidden = 1                         " search hidden files and directories
let g:Lf_FollowLinks = 1                        " search symlinks files and directories
let g:Lf_UseCache = 0                           " don't cache the list for real-time refresh
let g:Lf_UseMemoryCache = 0                     " don't use the memory to cache the indexing result for real-time refresh
" prevent the default value for don't open any 
" preview window automatically for performance
let g:Lf_PreviewResult = {
            \'BufTag': 0, 
            \'Function': 0
            \}
" include hidden files and symbolic links into ripgrep
let g:Lf_RgConfig = [
            \ "--hidden",
            \ "--follow"
            \]
let g:Lf_UseVersionControlTool = 0              " always use better(e.g: ripgrep) tool to index the files rather than version control one

" unpopup mode
" comment the options under popup mode to active
" let g:Lf_StlColorscheme = 'gruvbox_material'    " specify the colorscheme of statusline

" popup mode
" comment the options under unpopup mode to active
let g:Lf_WindowPosition = 'popup'               " specify the position of the window
let g:Lf_PopupPreviewPosition = 'bottom'        " specify where to locate the preview window when in popup mode
let g:Lf_StlColorscheme = 'gruvbox_default'     " specify the colorscheme of statusline

" intellisense engine for Vim 8 & NeoVim
"
" require Node.js:
" # sudo pacman -S nodejs
" # sudo pacman -S npm
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" use <Tab> for trigger completion and navigate to the next
inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <S-Tab> for navigate to the last
inoremap <expr> <S-TAB> pumvisible() ? "\<C-P>" : "\<C-H>"

" use <CR> for select the first completion and notify coc.nvim to format
" 
" remap <CR> for prevent line feed after select if navigate with <Tab> and <S-Tab>
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" goto code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if(index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" highlight the symbol and its references when hovering
autocmd CursorHold * silent call CocActionAsync('highlight')

" coc extensions need to install
"
" coc-java
" requre: at least Java 11
" # sudo pacman -S jdk11-openjdk
let g:coc_global_extensions = [
            \ 'coc-java',
            \ 'coc-snippets'
            \]

" tool for change the directory to the project root
Plug 'airblade/vim-rooter'
let rooter_patterns = ['.git']    " specify the root has a certain file or directory

" comment stuff out
Plug 'tpope/vim-commentary'

call plug#end()

" common
set nocompatible                  " make Vim not Vi-compatible
set nowrap                        " lines will not wrap displaying continues on the next line
set scrolloff=8                   " minimal number of screen lines to keep above and below the cursor
set backspace=indent,eol,start    " allow backspace over indent, line breaks, the start of insert
set ttimeout                      " time out for mappings and key codes
set ttimeoutlen=30                " milliseconds that is waited for a key code or mapped key sequence t>
set updatetime=100                " milliseconds that nothing is typed for the swap file writed and Cur>
set splitbelow                    " splitting a window will put the new window below the current one
set splitright                    " splitting a window will put the new window right of the current one
set visualbell                    " use a visual bell instead of beeping
set vb t_vb=                      " no beep or flash is wanted
set nrformats-=octal              " do not considered numbers that start with a zero to be octal
set noswapfile                    " not creat swapfile for the buffer
set hidden                        " allow having unsaved files that's not display on screen
set shortmess+=c                  " avoid the ins-completion-menu messages

" interface
set number             " print the line number precede each line
set relativenumber     " print the line number relative to the line with the cursor precede each line
syntax enable          " enable syntax highlighting of your current color settings
set showmatch          " briefly jump to the match bracket when one is inserted
set matchtime=1        " tenths of a second to show the matching bracket
set list               " turn on the List mode, display the special char
" strings to use in List mode and for the :list command
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
colorscheme gruvbox    " load color scheme gruvbox
set background=dark    " set the color background
set cursorline         " highlight the text line of the cursor
set noshowmode         " do not put a message of mode on the last line
set showtabline=2      " always display the line with tab page labels

" search
set ignorecase    " ignore case in search patterns, also used in the tags file
set smartcase     " override the ignorecase option if the search pattern contains upoper case char
set hlsearch      " highlight all its matches when there is a previous search pattern
set incsearch     " show where the pattern while typing a search command

" indent
set cindent                  " enable automatic C program indenting
set tabstop=4                " number of spaces that a Tab counts for
set softtabstop=4            " number of spaces that a Tab counts for while editing.
set shiftwidth=4             " number of spaces to use for each step of indent
set expandtab                " use the appropriate number of spaces to insert a Tab in Insert mode
filetype plugin indent on    " enable automatically do language-dependent indenting

" function
" jump to the last known cursor position when editing a file
autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \        exe "normal! g`\"" |
            \ endif

" mapping
" hjkl in Insert and Command mode
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>
cnoremap <C-H> <Left>
cnoremap <C-J> <Down>
cnoremap <C-K> <Up>
cnoremap <C-L> <Right>
" emacs operate in Insert and Command mode
inoremap <C-A> <Home>
inoremap <C-E> <End>
inoremap <C-D> <Del>
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-D> <Del>
