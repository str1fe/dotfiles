set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required!
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'tpope/vim-rails'
 Bundle 'kien/ctrlp.vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'altercation/vim-colors-solarized' 
 Bundle 'kchmck/vim-coffee-script'
 Bundle 'nathanaelkane/vim-indent-guides'
 Bundle 'thoughtbot/vim-rspec'

 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'
 " ...
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..
 "
 "
 
 augroup vimrcEx
   autocmd!
   " For all text files set 'textwidth' to 78 characters.
   autocmd FileType text setlocal textwidth=78
 augroup END
 
 " The Silver Searcher
 if executable('ag')
   " Use ag over grep
   set grepprg=ag\ --nogroup\ --nocolor

   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

   " ag is fast enough that CtrlP doesn't need to cache
   let g:ctrlp_use_caching = 0
 endif

 " bind K to grep word under cursor
 nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

 set smartindent
 set expandtab
 set shiftwidth=2
 set softtabstop=2
 set number
 set hlsearch
 set nobackup
 set noswapfile
 set cursorline
" autocmd vimenter * NERDTree
 
 syntax enable
 filetype plugin indent on
 set background=dark
 "colorscheme solarized
 se t_Co=16

 filetype plugin indent on

 " Ignore the following in searches
 set wildignore+=**/log/**
 set wildignore+=**/images/**

 map <Leader>t :call RunCurrentSpecFile()<CR>
 map <Leader>s :call RunNearestSpec()<CR>
 map <Leader>l :call RunLastSpec()<CR>
 map <Leader>a :call RunAllSpecs()<CR>
 let g:rspec_command = "!bundle exec rspec {spec}"

 "Easy change between panes
 nnoremap <C-J> <C-W><C-J>
 nnoremap <C-K> <C-W><C-K>
 nnoremap <C-L> <C-W><C-L>
 nnoremap <C-H> <C-W><C-H>

 "Split panes below and to the right
 set splitbelow
 set splitright

 " Display extra whitespace
 set list listchars=tab:»·,trail:·

 " Make vim faster
 set ttyfast
 set synmaxcol=300
 set ttyscroll=3
 set lazyredraw


 set rnu

 " Paste text
 nnoremap <F2> :set invpaste paste?<CR>
 set pastetoggle=<F2>
 set showmodge
