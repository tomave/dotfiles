"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'
" Bundles for colors
Bundle 'tomasr/molokai'
Bundle 'altercation/vim-colors-solarized'
" Bundles for snippets
Bundle 'SirVer/ultisnips'
" Autocomplete
Bundle 'Valloric/YouCompleteMe'
" Bundles for navigation
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
" Bundles for editing support
Bundle 'tpope/vim-surround'
" Bundle for statusline
Bundle 'bling/vim-airline'
" Bundle for fast navigation
Bundle 'Lokaltog/vim-easymotion'
" Syntax checking
Bundle 'scrooloose/syntastic'

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set autowrite
set noswapfile

" set autowrite
set autowrite

" Set default encoding
set encoding=utf-8

" Set how many lines of history VIM has to remember
set history=700

" Set relative line number
set number

" Set to auto read when a file is changed from the outside
set autoread

" Paste yanked text to global clipboard
set clipboard=unnamed

" Always show current position
set ruler

" Set offset lines when moving cursor
set so=10

" Enable wild menu
set wildmenu

" Ignore compiled files from wildmenu
set wildignore=*/target/*

" set wildmode
set wildmode=longest,list

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" Enable smart case or searching
set smartcase

" Higlight search results
set hlsearch

" Incremental search
set incsearch

" Turn on magic for regular expressions
set magic

" Show matching brackets
set showmatch

" disable search wrap around the end of file
set nows

" gvim settings
if has("gui_running")
    " remove menu bar
    set guioptions-=m  

    " remove toolbar
    set guioptions-=T  

    " remove right-hand scroll bar
    set guioptions-=r  

    " remove left-hand scroll bar
    set guioptions-=L  

    " maximize gvim window.
    set lines=999 columns=999
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set color theme for gvim only
if has("gui_running")
    colorscheme molokai
else
    colorscheme molokai
    set background=dark
endif

" Set font size
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Inconsolata\ 11
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

" Enable syntax highlighting
syntax enable

" Set file format handling
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and ident related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Using spaces instead of tabs
set expandtab

" Enable smart tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" Enable auto indent
set autoindent

" Enable smart indent
set smartindent

" Enable wrap lines
set wrap

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" remove higlight for search results
nmap <cr> :nohlsearch<cr>

" Fast saving
nmap <leader>w :update<cr>

" Fast quitting
nmap <leader>q :q<cr>

" Fast saving and quitting
nmap <leader>x :x<cr>

" Toggle NERDTree
nmap <leader>nt :NERDTreeToggle<cr>

" Fast visual mode
imap jj <Esc>

" make command
map <leader>b :make<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp config
let g:ctrlp_map=''
let g:ctrlp_macth_window='bottom,order:btt,min:1,max:10'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_reversed=0
map <leader>f :CtrlP<CR>
map <leader>r :CtrlPBufTag<CR>
map <leader>e :CtrlPBuffer<CR>
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

" ctrlp ignores
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|settings|project)$',
            \ 'file': '\v\.(exe|so|dll|class)$',
            \ }

" ctrlp cache directory
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

" ctrlp use silver_searcher for fuzzy searchh
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    set grepprg=ag\ --nogroup\ --nocolor
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ruby related stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" execute current ruby script
autocmd FileType ruby set makeprg=ruby\ -cw\ %

" execute ri for the the word under the cursor
autocmd FileType ruby nmap <leader>h :!ri <cword><cr>

" executing rspec files
autocmd FileType ruby map <leader>t :call RunCurrentSpecFile()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" shell script related stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType sh set makeprg=%:p

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" javascript stuff 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType javascript set makeprg=node\ %

" youcomplete configuration
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsListSnippets="<leader-l>"
let g:UltiSnipsListSnippetsDirectory=["UltiSnips"]
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

