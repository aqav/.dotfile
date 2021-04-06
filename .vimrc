syntax on

" ttimeoutlen in tmux
if $TMUX != ''
    set ttimeoutlen=20
elseif &ttimeoutlen > 60 || &ttimeoutlen <= 0
    set ttimeoutlen=60
endif 

# no bell
set visualbell

" number
set number
set relativenumber
