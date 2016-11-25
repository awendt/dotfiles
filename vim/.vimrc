set number
syntax on
au BufNewFile,BufRead */.ssh/config.d/*	setf sshconfig
execute pathogen#infect()
