set nocompatible
if has("syntax")
  syntax on
endif

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif



" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd            " Show (partial) command in status line.
set showmatch          " Show matching brackets.
set ignorecase         " Do case insensitive matching
set smartcase          " Do smart case matching
set incsearch          " Incremental search
set autowrite          " Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a            " Enable mouse usage (all modes)
set tabstop=4
set shiftwidth=4
set expandtab
set hidden
set history=1000
set ruler
"set colorcolumn=80
"set number
"use F2 to toggle numbering
nnoremap <F2> :set nonumber!<CR> 
if has("matchadd")
    highlight ColorColumn ctermbg=magenta
    call matchadd('ColorColumn', '\%81v', 100)
endif

"Many of these are from http://items.sjbach.com/319/configuring-vim-right
" We usually want to jump to a line+column, not just the line.
nnoremap ' `
nnoremap ` '

let mapleader = ","
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
set scrolloff=3
map <leader>c <C-_><C-_>

filetype off                " required!
" Setting up Vundle - the vim plugin bundler
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
    "Add your bundles here
    Bundle 'Syntastic' 
    Bundle 'altercation/vim-colors-solarized' 
    "Bundle 'https://github.com/tpope/vim-fugitive'
    "...All your other bundles...
    Bundle 'rodjek/vim-puppet'
    Bundle 'godlygeek/tabular'
    Bundle 'davidhalter/jedi-vim'
    Bundle 'scrooloose/nerdtree'
    Bundle 'gavinbeatty/dragvisuals.vim'
    Bundle 'surround.vim'
    Bundle 'tComment'
    Bundle 'jnwhiteh/vim-golang'
    Bundle 'Gundo'
    Bundle 'vimux'
    Bundle 'SuperTab-continued.'
    if iCanHazVundle == 0
        echo "Installing Bundles, please ignore key map error messages"
        echo ""
        :BundleInstall
    endif
" Setting up Vundle - the vim plugin bundler end
"
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

map <F3> :NERDTreeToggle<CR>
au BufRead,BufNewFile *.md set filetype=markdown

runtime plugin/dragvisuals.vim
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
vmap  <expr>  D        DVB_Duplicate()
" Remove any introduced trailing whitespace after moving...     ##
let g:DVB_TrimWS = 1

set background=dark
colorscheme solarized

nnoremap <F5> :GundoToggle<CR>
let g:gundo_width = 25
let g:gundo_preview_bottom = 1
map <leader>vp :VimuxPromptCommand<CR>
map <leader>vl :VimuxRunLastCommand<CR>
map <leader>vi :VimuxInspectRunner<CR>
map <leader>vq :VimuxCloseRunner<CR>

" If working on a golang file, use ,r to run 'go run' 
au FileType go map <leader>r :!go run %<CR>
