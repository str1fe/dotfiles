set nocompatible               " be iMproved
 filetype off                   " required!

 set rtp+=~/.config/nvim/bundle/Vundle.vim/
 call vundle#rc()

 call plug#begin()

 Plug 'tpope/vim-fugitive'
 Plug 'Lokaltog/vim-easymotion'
 Plug 'tpope/vim-rails'
 Plug 'kien/ctrlp.vim'
 Plug 'scrooloose/nerdtree'
 Plug 'altercation/vim-colors-solarized' 
 Plug 'kchmck/vim-coffee-script'
 Plug 'nathanaelkane/vim-indent-guides'
 Plug 'thoughtbot/vim-rspec'
 Plug 'nanotech/jellybeans.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'elzr/vim-json'
 Plug 'ngmy/vim-rubocop'
 Plug 'isRuslan/vim-es6'
 Plug 'andys8/vim-elm-syntax'
 Plug 'w0ng/vim-hybrid'
 Plug 'dylanaraps/wal'
 Plug 'scrooloose/syntastic'
 Plug 'tomlion/vim-solidity'
 Plug 'junegunn/seoul256.vim'
 Plug 'slim-template/vim-slim'

 " Use :PlugInstall
 call plug#end()

 
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

 let g:ctrlp_max_files=0

 " bind K to grep word under cursor
 nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

 set smartindent
 set expandtab
 set shiftwidth=2
 set softtabstop=2
 "set number
 set hlsearch
 set nobackup
 set noswapfile
 "set cursorline
" autocmd vimenter * NERDTree
 
 syntax enable
 filetype plugin indent on
 set background=dark
 se t_Co=16

 "filetype plugin indent on

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
 set lazyredraw

 set rnu

 " Paste text
 nnoremap <F2> :set invpaste paste?<CR>
 set pastetoggle=<F2>
 set showmode

map <F1> :NERDTreeToggle<CR>
let g:NERDTreeMinimalMenu=1

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1

"let g:hybrid_custom_term_colors = 1
"colorscheme hybrid
colorscheme jellybeans

" For lightlime status bar:
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ }
      \ }

" Hightlight hamlc
au BufNewFile,BufRead *.hamlc setf haml


"SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']
"let g:syntastic_solidity_checkers = ['solium', 'solc', 'solhint']

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|log\|tmp'

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

let g:ctrlp_user_command =  
  \ ['.git', 'cd %s && git ls-files -co --exclude-standard'] 
