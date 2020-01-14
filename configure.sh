command -v vim || yum install -y vim || apt install -y vim-gtk
command -v xsel || yum install -y xsel || apt install -y xsel
echo "set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/ervandew/supertab'
Plugin 'https://github.com/ConradIrwin/vim-bracketed-paste'
Plugin 'flazz/vim-colorschemes'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
\" All of your Plugins must be added before the following line
call vundle#end()            \" required

if \$COLORTERM == 'gnome-terminal'
          set t_Co=256
  endif

filetype plugin indent on
syntax on
colorscheme badwolf

set tabstop=4
set number
set autoindent
set shiftwidth=4
set expandtab
set smartindent
set encoding=utf-8
set mouse=a

set cursorline
vnoremap <silent> <C-C> \"+y
nnoremap <silent> <c-v> \"+p
inoremap <silent> <C-V> <C-R><C-P>+

set fileencodings=utf-8,cp1251,cp866,koi8-r
inoremap <silent> <C-j> <C-O>dd<Down><C-R><C-P>\"<Up>
\" inoremap <silent> <C-k> <C-O>dd<Up><C-R><C-P>\"<Up>
\" nnoremap <silent> <C-k> dd<Up>i<C-R><C-P>\"<Up><Esc>
nnoremap <silent> <C-j> dd<Down>i<C-R><C-P>\"<Esc><Up>
nnoremap <F3> :set hlsearch!<CR>

map <C-n> :NERDTreeToggle<CR>
nnoremap <C-H> :Hexmode<CR>
inoremap <C-H> <Esc>:Hexmode<CR>
vnoremap <C-H> :<C-U>Hexmode<CR>

augroup END
set backspace=indent,eol,start

" > ~/.vimrc
command -v git || yum install -y git || apt install -y git
command -v curl || yum install -y curl || apt install -y curl
mkdir -p ~/.vim/bundle/
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

echo "
transfer() { if [ \$# -eq 0 ]; then echo -e \"No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md\"; return 1; fi 
tmpfile=\$( mktemp -t transferXXX ); if tty -s; then basefile=\$(basename \"\$1\" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file \"\$1\" \"https://transfer.sh/\$basefile\" >> \$tmpfile; else curl --progress-bar --upload-file \"-\" \"https://transfer.sh/\$1\" >> \$tmpfile ; fi; cat \$tmpfile; command -v xsel && cat \$tmpfile | xsel -b; rm -f \$tmpfile; }
" >> ~/.bashrc
