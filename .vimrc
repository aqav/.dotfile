if $TMUX != ''
    set ttimeoutlen=20
elseif &ttimeoutlen > 60 || &ttimeoutlen <= 0
    set ttimeoutlen=60
endif

set number
set relativenumber
