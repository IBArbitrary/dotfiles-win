" GVIM settings
set gfn=SauceCodePro_NF:h11:cANSI:qCLEARTYPE
set bg=dark
set go-=m " disable menu bar
set go-=T " disable tool bar
set go-=r " disable scroll bar
set go-=L " disable left scroll bar

" color for terminal
set t_Co=256
set termguicolors
" highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE
set cursorline
syntax on
set colorcolumn=80

" mouse options
set mouse=a
set scf
set mousef

" tabs and indenting
set ts=4
set sw=4

" some misc set-s
set number relativenumber
set backspace=indent,eol,start
set ruler
set title
set encoding=utf-8
filetype plugin on
filetype indent on
set updatetime=100
set shortmess+=c
set signcolumn=yes
set hls is
set pastetoggle=<F3>
set wildmenu
if has('gui_running')
	set list
	set listchars=tab:――→,eol:¬
	set listchars+=trail:∙
	set listchars+=nbsp:∙
	set listchars+=space:∙
	set listchars+=extends:▶
	set listchars+=precedes:◀
else
	set nolist
endif

" Plugins (vim-plug) -------------------------------
call plug#begin('~\.vim\plugged')

Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
Plug 'ctrlpvim/ctrlp.vim'

if has('nvim') || has('patch=8.0.902')
	Plug 'mhinz/vim-signify'
else
	Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-css-color'
call plug#end()
"---------------------------------------------------

" remaps

" elementary maps
nnoremap <SPACE> <Nop>
let mapleader = " "
inoremap jk <Esc>
inoremap kj <Esc>
nnoremap <CR> :noh<CR><CR>
vnoremap <C-c> "*y

" Startify
nnoremap <C-\> :Startify<CR>
let g:startify_custom_header = [
\' _____________/\/\_______________________________________________',
\' _/\/\__/\/\__________/\/\/\__/\/\_______________________________',
\' _/\/\__/\/\__/\/\____/\/\/\/\/\/\/\_____________________________',
\' ___/\/\/\____/\/\____/\/\__/\__/\/\_____________________________',
\' _____/\______/\/\/\__/\/\______/\/\_____________________________',
\' ________________________________________________________________',
\]

" NERD tree
map <leader>n :NERDTreeToggle<CR>

" windows, buffers and tabs

" buffers
nnoremap <leader>b :buffers<CR>:buffer<Space>
nnoremap <leader>jj :bnext<CR>
nnoremap <leader>kk :bprev<CR>
nnoremap <leader>zz :bdelete<CR>

" windows

" window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" split controls
map <leader>hh :sp<Space>
map <leader>vv :vsp<Space>
map <leader>ww :new<Space>

" tabs
nnoremap <leader>tj :tabnext<CR>
nnoremap <leader>tk :tabprevious<CR>
nnoremap <leader>tf :tabfirst<CR>
nnoremap <leader>tl :tablast<CR>
nnoremap <leader>tt :tabnew<Space>


" themes
autocmd vimenter * ++nested colorscheme gruvbox " overall

" airline settings
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#excludes = ['branches', 'index']
let g:airline#extensions#tabline#buffer_idx_mode = 1

" disabling bell
set noerrorbells visualbell t_vb=
if has('autocmd')
	autocmd GUIEnter * set visualbell t_vb=
endif

" setting powershell as default
set shell=powershell.exe
set shellcmdflag=-Command
set shellpipe=|
set shellredir=>
