set number
syntax on
au BufNewFile,BufRead */.ssh/config.d/*	setf sshconfig
au FileType gitcommit execute "normal! g"  | startinsert
execute pathogen#infect()

set background=light
let g:solarized_diffmode="high"
colorscheme solarized
