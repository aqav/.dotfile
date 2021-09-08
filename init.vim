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
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }

" intellisense engine for Vim 8 & NeoVim
"
" 1. # sudo pacman -S nodejs
" 2. # sudo pacman -S npm
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tool for change the directory to the project root with a consistent approach
Plug 'airblade/vim-rooter'

" comment stuff out
Plug 'tpope/vim-commentary'

" plugin that format code by external programs
"
" Java: Artistic Style(http://astyle.sourceforge.net/)
" 1. download astyle_<version>_linux.tar.gz(at least version 2.0.5 or higher)
" 2. decompress astyle_<version>_linux.tar.gz
" 3. compiling the source code
" 4. add execute file into /usr/local/bin
"
" Json: JS Beautifier(https://github.com/beautify-web/js-beautify)
" 1. # sudo pip install jsbeautifier
Plug 'vim-autoformat/vim-autoformat'

" make vim internal terminal better
"
" 1. # sudo pip3 install neovim-remote
" 2. # sudo pacman -S which
Plug 'skywind3000/vim-terminal-help'

" generic client for Debug Adapters
"
" Java: :VimspectorInstall vscode-java-debug
Plug 'puremourning/vimspector'

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


" ======== mapping ========

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


" ======== plugin config ========

" ---- vim-airlinea ----
let g:airline#extensions#tabline#enabled = 1                  " display all buffers when there're only one tab
let g:airline#extensions#tabline#formatter = 'unique_tail'    " pwd might be too long sometime
let g:airline_section_b = "
            \%{get(g:,'coc_git_status','')}
            \%{get(b:,'coc_git_status','')}
            \"

" ---- LeaderF ----
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
            \"--follow"
            \]
let g:Lf_UseVersionControlTool = 0              " always use better(e.g: ripgrep) tool to index the files rather than version control one

let g:Lf_WindowPosition = 'popup'               " specify the position of the window
let g:Lf_PopupPreviewPosition = 'bottom'        " specify where to locate the preview window when in popup mode
let g:Lf_StlColorscheme = 'gruvbox_default'     " specify the colorscheme of statusline

" ---- coc.nvm ----
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
    if(index(['vim','help'], &filetype) >= 0)
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

" coc extensions need to install
"
" coc-java(at least Java 11)
" 1. # sudo pacman -S jdk11-openjdk
" 2. # sudo pacman -S openjdk11-src
"
" coc-git
" 1. # sudo pacman -S git
let g:coc_global_extensions = [
            \'coc-json',
            \'coc-java',
            \'coc-java-debug',
            \'coc-snippets',
            \'coc-git'
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

" symbol rename
nmap <leader>rn <Plug>(coc-rename)

" key mappings for code action
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac  <Plug>(coc-codeaction-line)
nmap <leader>af  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" ---- vim-rooter ----
" specify the root has a certain file or directory
let rooter_patterns = [
            \'.git',
            \'pom.xml',
            \'.vimspector.json'
            \]

" ---- vim-autoformat ----
autocmd BufWrite * :Autoformat    " format code upon saving file

" ---- vim-terminal-help ----
" aware I'm in terminal
" require under the line which config colorscheme
hi TermColor ctermbg=0 ctermfg=15
autocmd TermOpen * setlocal winhighlight=Normal:TermColor

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
