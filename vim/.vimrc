set number
set hlsearch
syntax on
au BufNewFile,BufRead */.ssh/config.d/*	setf sshconfig
au FileType gitcommit execute "normal! g"  | startinsert
execute pathogen#infect()

" Order is important here, see https://superuser.com/a/1353972/134305
let iterm_profile = $ITERM_PROFILE
if iterm_profile == "Default"
    set background=light
    let g:solarized_diffmode="high"
    colorscheme solarized
endif

" Make search results appear in the middle of the screen
nnoremap n nzz
nnoremap N Nzz

filetype plugin indent on
