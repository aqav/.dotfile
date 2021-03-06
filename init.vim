" ln -s ~/.dotfile/init.vim ~/.config/nvim/init.vim

" ======== plugin ========

call plug#begin(stdpath('data') . '/plugged')

" distinguishable, contrast colorscheme and still pleasant for the eyes
Plug 'morhetz/gruvbox'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" efficient fuzzy finder that helps to locate something
"
" 1. # sudo pacman -S python3
" 2. # sudo pacman -S python-pip
" 3. # python3 -m pip install --user --upgrade pynvim
" 4. :LeaderfInstallCExtension(for performance)
" 5. # sudo pacman -S ripgrep(for better index)
Plug 'Yggdroot/LeaderF', { 'on': 'Leaderf' }

" intellisense engine for Vim 8 & NeoVim
"
" 1. # sudo pacman -S nodejs
" 2. # sudo pacman -S npm
"
" 1. # rm ~/.config/nvim/coc-settings.json
" 2. # ln -s ~/.dotfile/coc-settings.json ~/.config/nvim/coc-settings.json
Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" tool for change the directory to the project root with a consistent approach
Plug 'airblade/vim-rooter'

" comment stuff out
Plug 'tpope/vim-commentary'

" plugin that format code by external programs
"
" # python3 -m pip install pynvim
"
" Java: Artistic Style(http://astyle.sourceforge.net/)
" 1. download astyle_<version>_linux.tar.gz(at least version 2.0.5 or higher)
" 2. decompress astyle_<version>_linux.tar.gz
" 3. compiling the source code
" 4. add execute file into /usr/local/bin
"
" Json: JS Beautifier(https://github.com/beautify-web/js-beautify)
" 1. # sudo pip install jsbeautifier
"
" XML: tidy
" 1. # sudo pacman -S tidy
"
" GO: gofmt
" 1. # sudo pacman -S go
Plug 'vim-autoformat/vim-autoformat'

" make vim internal terminal better
"
" 1. # sudo pip3 install neovim-remote
" 2. # sudo pacman -S which
Plug 'skywind3000/vim-terminal-help'

" generic client for Debug Adapters
"
" 1. # cd ~/.local/share/nvim/plugged/vimspector
" 2. # rm -r configurations
" 3. # ln -s ~/.dotfile/.vimspector configurations
"
" Java: :VimspectorInstall vscode-java-debug
Plug 'puremourning/vimspector', { 'for': 'java' }

" overide default text objects for seeking and add more
Plug 'wellle/targets.vim'

" simpler way to use some motions
Plug 'easymotion/vim-easymotion'

" run shell command in background
Plug 'skywind3000/asyncrun.vim', { 'for': 'java' }

" imitating vscode's task system
"
" require
" 1. Plug 'skywind3000/asyncrun.vim'
"
" 1. # rm .config/nvim/tasks.ini
" 2. # ln -s ~/.dotfile/tasks.ini ~/.config/nvim/tasks.ini
Plug 'skywind3000/asynctasks.vim', { 'for': 'java' }

" normal mode key mappings for commonly usage
Plug 'tpope/vim-unimpaired'

" key mappings to operate surroundings in pairs
Plug 'tpope/vim-surround'

" vinegar split explorer
"
" ref: http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
Plug 'justinmk/vim-dirvish'

" repeat the last map as a whole
Plug 'tpope/vim-repeat'

" take care of the tags file
"
" 1. # sudo pacman -S ctags(Universal Ctags)
Plug 'ludovicchabant/vim-gutentags'

" Hex editing in Vim
"
" 1. # sudo paru -S xxd-standalone
Plug 'fidian/hexmode'

call plug#end()


" ======== config ========

" common
set nocompatible                  " make Vim not Vi-compatible
set nowrap                        " lines will not wrap displaying continues on the next line
set scrolloff=8                   " minimal number of screen lines to keep above and below the cursor
set backspace=indent,eol,start    " allow backspace over indent, line breaks, the start of insert
set ttimeout                      " time out for mappings and key codes
set ttimeoutlen=30                " milliseconds that is waited for a key code or mapped key sequence
set updatetime=100                " milliseconds that nothing is typed for the swap file writed, also used for CursorHold
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

" make inactive window background become dark for intuition
" make the foreground color of terminal window white for intuition
"
" setting 'winhighlight' require blow the line which config colorscheme
highlight WinLeaveColor ctermbg=0
highlight TermLeaveColor ctermbg=0 ctermfg=15
highlight TermEnterColor ctermfg=15
function! OnWinEnter()
    if &buftype ==# 'terminal'
        setlocal winhighlight=Normal:TermEnterColor
    else
        setlocal winhighlight=Normal:Normal
    endif
endfunction
function! OnWinLeave()
    if &buftype ==# 'terminal'
        setlocal winhighlight=Normal:TermLeaveColor
    else
        setlocal winhighlight=Normal:WinLeaveColor
    endif
endfunction
autocmd WinEnter * call OnWinEnter()
autocmd WinLeave * call OnWinLeave()
" it's wired
autocmd TermEnter * setlocal winhighlight=Normal:TermEnterColor

" ======== mapping ========
"
" Ctrl key mapping is case-insensitivity
" Alt key mapping is case-sensitivity

" operator: <C-hjkl>
noremap <C-h> <Left>
noremap <C-j> <Down>
noremap <C-k> <Up>
noremap <C-l> <Right>

inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" operator: <A-hjkl>
noremap <A-h> b
noremap <A-j> gj
noremap <A-k> gk
noremap <A-l> w

inoremap <A-h> <C-Left>
inoremap <A-j> <C-\><C-o>gj
inoremap <A-k> <C-\><C-o>gk
inoremap <A-l> <C-Right>

cnoremap <A-h> <C-Left>
cnoremap <A-l> <C-Right>

" operator: <C-aed>, like bash
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-d> <Del>

cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" I always make this mistake
nnoremap q: :q<CR>

" ======== plugin config ========

let g:window_height = 20
let g:project_root = [
            \'.git',
            \'pom.xml',
            \'.vimspector.json',
            \'.root'
            \]

" ---- vim-airlinea ----
let g:airline#extensions#tabline#enabled = 1                  " display all buffers when there're only one tab
let g:airline#extensions#tabline#formatter = 'unique_tail'    " pwd might be too long sometime
let g:airline_section_b = "
            \%{get(g:,'coc_git_status','')}
            \%{get(b:,'coc_git_status','')}
            \"

" ---- LeaderF ----

" key mappings provided by LeaderF
nmap <silent> <Leader>f :Leaderf file --no-ignore<CR>
nmap <silent> <Leader>m :Leaderf mru<CR>
nmap <silent> <Leader>b :Leaderf buffer<CR>
nmap <silent> <Leader>r :Leaderf rg<CR>
nmap <silent> <Leader>c :Leaderf function<CR>
nmap <silent> <Leader>t :Leaderf tag<CR>
nmap <silent> <Leader>u :Leaderf bufTag<CR>

" specify the files and directories should be ignored
let g:Lf_WildIgnore = {
            \ 'dir': ['.git', 'target'],
            \ 'file': []
            \}

" specify the files ignored in MRU files
let g:Lf_MruWildIgnore = {
            \ 'dir': ['.git', 'target'],
            \ 'file': []
            \}

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
" prevent the default value to not open any
" preview window automatically for performance
let g:Lf_PreviewResult = {
            \'BufTag': 0,
            \'Function': 0
            \}
" include hidden files and symbolic links into ripgrep
let g:Lf_RgConfig = [
            \"--hidden",
            \"--follow",
            \"--no-ignore"
            \]
let g:Lf_UseVersionControlTool = 0              " always use better(e.g: ripgrep) tool to index the files rather than version control one

let g:Lf_WindowPosition = 'popup'               " specify the position of the window
let g:Lf_PopupPreviewPosition = 'bottom'        " specify where to locate the preview window when in popup mode
let g:Lf_StlColorscheme = 'gruvbox_default'     " specify the colorscheme of statusline

" ---- coc.nvim ----
" use <Tab> for trigger completion and navigate to the next
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

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

" extend K to show documentation
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

" highlight the symbol and its references when hovering
autocmd CursorHold * silent call CocActionAsync('highlight')

" rename
nmap <leader>rn <Plug>(coc-rename)

" coc extensions need to install
"
" coc-java(at least Java 11)
" 1. # sudo pacman -S jdk11-openjdk
" 2. # sudo pacman -S openjdk11-src
"
" coc-git
" 1. # sudo pacman -S git
"
" coc-go
" 1. # sudo pacman -S go
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-java',
            \'coc-java-debug',
            \'coc-snippets',
            \'coc-git',
            \'coc-pairs',
            \'coc-vimlsp',
            \'coc-yank',
            \'coc-lists',
            \'coc-go'
            \]

" text objects of function and class provided by coc
"
" requre 'textDocument.ducometSymbol' support from the LSP
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" text objects of git chunk provided by coc-git
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" key mappings for provided by coc-git
nmap gs <Plug>(coc-git-chunkinfo)
nmap gm <Plug>(coc-git-commit)
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)

" key mappings for diagnostic
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" key mappings for code action
xmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>a <Plug>(coc-codeaction-selected)
nmap <Leader>ac <Plug>(coc-codeaction-line)
nmap <Leader>af <Plug>(coc-codeaction)
nmap <Leader>qf <Plug>(coc-fix-current)

" key mappings for CocList
nnoremap <silent><nowait> <Space>y :<C-u>CocList -A --normal yank<cr>

" ---- vim-rooter ----
let rooter_patterns = g:project_root    " specify the root has a certain file or directory
let g:rooter_silent_chdir = 1           " stop echoing the project directory

" ---- vim-autoformat ----

" format the specify filetypes
autocmd BufWrite init.vim,
            \*.java,
            \*.json,
            \*.xml,
            \*.go
            \ :Autoformat

" ---- vim-terminal-help ----
"
" key mappings of windows swith provided by vim-terminal-help:
"
" noremap <A-H> <C-w>h
" noremap <A-J> <C-w>j
" noremap <A-K> <C-w>k
" noremap <A-L> <C-w>l
" inoremap <A-H> <ESC><C-w>h
" inoremap <A-J> <ESC><C-w>j
" inoremap <A-K> <ESC><C-w>k
" inoremap <A-L> <ESC><C-w>l
" tnoremap <A-H> <C-\><C-n><C-w>h
" tnoremap <A-J> <C-\><C-n><C-w>j
" tnoremap <A-K> <C-\><C-n><C-w>k
" tnoremap <A-L> <C-\><C-n><C-w>l
"
" tnoremap <A-N> <C-\><C-n><C-w>p
" tnoremap <A-q> <C-\><C-n>
" tnoremap <A--> <C-\><C-n>"0pa

let g:terminal_list = 0                    " hide terminal buffer in buffer list
let g:terminal_height = g:window_height    " terminal height

" ---- netrw ----
let g:netrw_banner = 0    " suppress the banner

" ---- vimspector ----

" the value will be used when running :VimspectorInstall with no argus and :VimspectorUpdate
let g:vimspector_install_gadgets = [
            \'vscode-java-debug'
            \]

" HUMAN key mappings enabled
nmap <silent> <F9> <Plug>VimspectorToggleBreakpoint
nmap <silent> <Leader><F9> <Plug>VimspectorToggleConditionalBreakpoint

" HUMAN key mappings enabled while debugging and clear them when closing debugger
let s:mapped = {}
function! s:OnJumpToFrame() abort
    if has_key( s:mapped, string( bufnr() ) )
        return
    endif
    nmap <silent> <F3> <Plug>VimspectorStop
    nmap <silent> <F4> <Plug>VimspectorRestart
    nmap <silent> <F5> <Plug>VimspectorContinue
    nmap <silent> <F6> <Plug>VimspectorPause
    nmap <silent> <F7> <Plug>VimspectorBalloonEval
    xmap <silent> <F7> <Plug>VimspectorBalloonEval
    nmap <silent> <F10> <Plug>VimspectorStepOver
    nmap <silent> <F11> <Plug>VimspectorStepInto
    nmap <silent> <F12> <Plug>VimspectorStepOut
    nmap <silent> <Leader><F11> <Plug>VimspectorUpFrame
    nmap <silent> <Leader><F12> <Plug>VimspectorDownFrame
    let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }
    setlocal nomodifiable
endfunction
function! s:OnDebugEnd() abort
    let original_buf = bufnr()
    let hidden = &hidden
    try
        set hidden
        for bufnr in keys( s:mapped )
            try
                execute 'noautocmd buffer' bufnr
                silent! nunmap <F3>
                silent! nunmap <F4>
                silent! nunmap <F5>
                silent! nunmap <F6>
                silent! nunmap <F7>
                silent! xunmap <F7>
                silent! nunmap <F10>
                silent! nunmap <F11>
                silent! nunmap <F12>
                silent! nunmap <Leader><F11>
                silent! nunmap <Leader><F12>
                let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
            endtry
        endfor
    finally
        execute 'noautocmd buffer' original_buf
        let &hidden = hidden
    endtry
    let s:mapped = {}
endfunction
autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
autocmd User VimspectorDebugEnded call s:OnDebugEnd()

" use <Leader><F5> to start Java debug by coc-java-debug for no ask of DAPPort
function! JavaStartDebugCallback(err, port)
    call vimspector#LaunchWithSettings({ "DAPPort": a:port })
endfunction
function JavaStartDebug()
    call CocActionAsync(
                \ 'runCommand',
                \ 'vscode.java.startDebugSession',
                \ function('JavaStartDebugCallback')
                \)
endfunction
nmap <silent> <Leader><F5> :call JavaStartDebug()<CR>

" ---- target.vim ----
let g:targets_gracious = 0    " don't be too serious when the num is too large

" ---- asynctasks.vim ----
let g:asyncrun_open = g:window_height

" key mappings for asynctasks
noremap <silent><F5> :AsyncTask run<CR>
noremap <silent><F6> :AsyncTask file-build<CR>
noremap <silent><F8> :AsyncTask project-build<CR>

" ---- vim-gutentags ----
let g:gutentags_project_root = g:project_root    " specify the root, vim-gutentags require the root must be config

let s:vim_tags = expand('~/.cache/tags')
if !isdirectory(s:vim_tags)
    silent! call mkdir(s:vim_tags, 'p')
endif
let g:gutentags_cache_dir = s:vim_tags           " specify the directory to store tags files

" ---- Hexmode ----
let g:hexmode_patterns = '*.class'    " automatically open specific file in hex mode
