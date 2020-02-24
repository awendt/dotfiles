set number
syntax on
au BufNewFile,BufRead */.ssh/config.d/*	setf sshconfig
au FileType gitcommit execute "normal! g"  | startinsert
execute pathogen#infect()

" Order is important here, see https://superuser.com/a/1353972/134305
set background=light
let g:solarized_diffmode="high"
colorscheme solarized

" Make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz
