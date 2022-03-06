" File              : .vimrc
" Author            : David Barcene <david.barcene@utp.ac.pa>
" Date              : 15.01.2022
" Last Modified Date: 09.02.2022
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
	
	Plug 'lervag/vimtex', { 'for': 'tex' }
	Plug 'SirVer/ultisnips', { 'for': 'tex' }
	Plug '907th/vim-auto-save', { 'for': 'tex' }
	Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'nanotech/jellybeans.vim'
	Plug 'nvie/vim-flake8'
	Plug 'tranvansang/octave.vim'
	Plug 'elzr/vim-json'
	Plug 'preservim/vim-markdown'
	Plug 'preservim/nerdtree'
	Plug 'jiangmiao/auto-pairs'
	Plug 'junegunn/goyo.vim'
	Plug 'junegunn/fzf.vim'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-commentary'
	Plug 'tpope/vim-fugitive'
	Plug 'alpertuna/vim-header'
	Plug 'MathSquared/vim-python-sql'
	Plug 'vim-scripts/AutoComplPop'

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

set encoding=utf-8
set textwidth=80
set number relativenumber 
set nocompatible
set autoindent
set colorcolumn=+1
set hidden
syntax on
highlight Comment cterm=italic gui=italic

filetype plugin on
nnoremap <silent> vv <C-w>v
nnoremap <Leader>ve :e ~/.vimrc <CR>
nnoremap <Leader>vr :source ~/.vimrc <CR>

" ------------------------------------------------------------------------------
" 	Vimtex
" ------------------------------------------------------------------------------
let g:tex_flavor='xelatex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let g:vimtex_compiler_latexmk = { 
        \ 'executable' : 'latexmk',
        \ 'options' : [ 
        \   '-xelatex',
        \   '-file-line-error',
        \   '-synctex=1',
        \   '-interaction=nonstopmode',
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
let g:auto_save = 1 
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
let g:header_auto_add_header = 0
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
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" ------------------------------------------------------------------------------
"	CoC
" ------------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


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
