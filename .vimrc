# Put 'source path/to/.vimrc' to your .vimrc

if $TMUX != ''
    set ttimeoutlen=20
elseif &ttimeoutlen > 60 || &ttimeoutlen <= 0
    set ttimeoutlen=60
endif

syntax on
set visualbell

set number
set relativenumber
