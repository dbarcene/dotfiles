" File              : .vimrc
" Author            : David Barcene <david.barcene@utp.ac.pa>
" Date              : 15.01.2022
" Last Modified Date: 05.06.2024
" Last Modified By  : David Barcene <david.barcene@utp.ac.pa>


"       /VVVVVVVV\      /VVVVVVVV\
"       \VVVVVVVV/      \VVVVVVVV/
"        |VVVVVV|       /VVVVV/
"        |VVVVVV|      /VVVVV/
"        |VVVVVV|    /VVVVV/
"        |VVVVVV|  /VVVVV/
"        |VVVVVV|/VVV___
"        |VVVVVVVVVV/##/  _ _ _ _    ___  __ ______
"        |VVVVVVVV/___  /#_#,#_#,\  /##/_/#//#_#_#/
"        |VVVVVVV//##/ /#/ /#/ /#/  /#_#_#//#/
"        |VVVVV/  /#/ /#/ /#/ /#/  /#/    /#/
"        |VVV/   /#/ /#/ /#/ /#/  /#/     \#\____  
"        |V/   /##//##//##//###//##/       \####/



"# =========================================================================== #
"#
"# 	PLUGINS 
"#
"# =========================================================================== #

if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
	
	Plug 'nanotech/jellybeans.vim'
	Plug 'lervag/vimtex', { 'for': 'tex' }
	Plug 'SirVer/ultisnips', { 'for': 'tex' }
	Plug '907th/vim-auto-save', { 'for': 'tex' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'nvie/vim-flake8'
	Plug 'tranvansang/octave.vim'
	Plug 'elzr/vim-json'
	Plug 'jiangmiao/auto-pairs'
	Plug 'preservim/vim-markdown'
	Plug 'preservim/nerdtree'
	Plug 'junegunn/goyo.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'alpertuna/vim-header'
	Plug 'MathSquared/vim-python-sql'

call plug#end()

"# =========================================================================== #
"#
"# 	GENERAl SETTINGS
"#
"# =========================================================================== #


nnoremap <SPACE> <Nop>
let mapleader=" "

colorscheme jellybeans
let g:jellybeans_overrides = {
	\'background': { 'ctermbg': 'none', '256ctermbg': 'none' }
	\}
set backup
set noswapfile
silent !mkdir -p ./.bak > /dev/null 2>&1
silent !mkdir -p ./.swp > /dev/null 2>&1
set backupdir=./.bak
set directory=./.swp
set encoding=utf-8
set textwidth=85
set formatoptions+=t
ru mcros/justify.vim
"justify text
nnoremap <C-j> gggqG_j 
set number relativenumber 
set nocompatible
set autoindent
set autoread
set colorcolumn=+1
set hidden
syntax on
syntax sync fromstart
highlight Comment cterm=italic gui=italic

filetype plugin on
nnoremap <silent>vv <C-w>v
nnoremap <Leader>l <C-w>l
nnoremap <Leader>h <C-w>h
nnoremap <Leader>ve :e ~/.vimrc <CR>
nnoremap <Leader>vr :source ~/.vimrc <CR>

" Change buffers
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>

" ------------------------------------------------------------------------------
" 	Vimtex
" ------------------------------------------------------------------------------
let g:tex_flavor='xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \}
let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode'
        \ ],
        \}

" ------------------------------------------------------------------------------
" 	Ultisnips
" ------------------------------------------------------------------------------
let g:UltiSnipsExpandTrigger = '<tab>' 
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-Tab>'
let g:UltiSnipsSnippetsDir = "/home/dbarcene/.vim/UltiSnips"

" ------------------------------------------------------------------------------
" 	Vim-Auto-Save
" ------------------------------------------------------------------------------
let g:auto_save = 0 
set undofile
 
" ------------------------------------------------------------------------------
" 	Vim-Conceal
" ------------------------------------------------------------------------------
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

" ------------------------------------------------------------------------------
" 	Vim-Markdown
" ------------------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

" ------------------------------------------------------------------------------
" 	Nerdtree
" ------------------------------------------------------------------------------
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 

map <F6> :NERDTreeToggle<CR>

" ------------------------------------------------------------------------------
" 	Auto Pairs
" ------------------------------------------------------------------------------
let g:AutoPairsFlyMode = 1

" ------------------------------------------------------------------------------
" 	Vim-Header
" ------------------------------------------------------------------------------
let g:header_auto_add_header = 1
let g:header_field_author = 'David Barcene'
let g:header_field_author_email = 'david.barcene@utp.ac.pa'
map <F4> :AddHeader<CR>

" ------------------------------------------------------------------------------
"	Vimux
" ------------------------------------------------------------------------------
map <Leader>vp :VimuxPromptCommand<CR>

"# =========================================================================== #
"#
"# 	Python
"#
"# =========================================================================== #

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=80 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

if exists('python_highlight_all')
    unlet python_highlight_all
endif
let g:python_recommended_style = 0
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ------------------------------------------------------------------------------
"	Flake8
" ------------------------------------------------------------------------------
let g:flake8_show_in_gutter = 1
" let g:flake8_show_in_file = 1

" ------------------------------------------------------------------------------
"	CoC
" ------------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" ------------------------------------------------------------------------------
"	Powerline
" ------------------------------------------------------------------------------
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

set laststatus=2 " Always display the statusline in all windows
set showtabline=2 " Always display the tabline, even if there is only one tab
set noshowmode " Hide the default mode (e.g. -- INSERT -- below the statusline)
set t_Co=256


"# =========================================================================== #
"#
"# 	OCTAVE 
"#
"# =========================================================================== #


"Octave syntax
augroup filetypedetect
  au! BufRead,BufNewFile *.m,*.oct set filetype=octave
augroup END


let octave_highlight_variables=1
let octave_highlight_operators=1

" Use keywords from Octave syntax language file for autocomplete 
if has("autocmd") && exists("+omnifunc") 
  autocmd Filetype octave if &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif 
  autocmd FileType octave  setlocal keywordprg=info\ octave\ --vi-keys\ --index-search
  autocmd FileType octave  setlocal complete+=k
  autocmd FileType octave  setlocal completeopt=menuone,longest
  autocmd FileType octave  setlocal dictionary=~/.vim/syntax/octave.vim
endif


"# =========================================================================== #
"#
"# 	JSON 
"#
"# =========================================================================== #

let g:syntastic_json_checkers = ['jsonlint']
let g:vim_json_syntax_conceal = 0
