"
"       /VVVVVVVV\      /VVVVVVVV\
"       \VVVVVVVV/      \VVVVVVVV/
"        |VVVVVV|       /VVVVV/
"        |VVVVVV|      /VVVVV/
"        |VVVVVV|    /VVVVV/
"        |VVVVVV|  /VVVVV/
"        |VVVVVV|/VVV___
"        |VVVVVVVVVV/##/  _ _ _ _    ___  __ ______
"        |VVVVVVVVV___  /#_#,#_#,\  /##/_/#//#_#_#/
"        |VVVVVVV//##/ /#/ /#/ /#/  /#_#_#//#/
"        |VVVVV/  /#/ /#/ /#/ /#/  /#/    /#/
"        |VVV/   /#/ /#/ /#/ /#/  /#/     \#\____  
"        'V/   /##//##//##//###//##/       \####/
"	


"# =============================================================================== #
"#
"# 	PLUGINS 
"#
"# =============================================================================== #

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
		Plug 'christoomey/vim-tmux-navigator'
		Plug 'nanotech/jellybeans.vim'
		Plug 'nvie/vim-flake8'
		Plug 'jiangmiao/auto-pairs'
		Plug 'tpope/vim-surround'
		Plug 'preservim/nerdtree'
		Plug 'alpertuna/vim-header'
		Plug 'MathSquared/vim-python-sql'	
	call plug#end()

" ----------------------------------------------------------------------------------
" 	Vimtex
" ----------------------------------------------------------------------------------
	let g:tex_flavor='latex'
	let g:vimtex_general_view_method='zathura'
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

" ----------------------------------------------------------------------------------
" 	Ultisnips
" ----------------------------------------------------------------------------------
	let g:UltiSnipsExpandTrigger = '<tab>' 
	let g:UltiSnipsJumpForwardTrigger = '<tab>'
	let g:UltiSnipsJumpBackwardTrigger = '<s-Tab>'
	let g:UltiSnipsSnippetsDir = "/home/dbarcene/.vim/UltiSnips"

" ----------------------------------------------------------------------------------
" 	Vim-Auto-Save
" ----------------------------------------------------------------------------------
	let g:auto_save = 1 
	 
" ----------------------------------------------------------------------------------
" 	Vim-Auto-Save
" ----------------------------------------------------------------------------------
	set conceallevel=1
	let g:tex_conceal='abdmg'
	hi Conceal ctermbg=none

" ----------------------------------------------------------------------------------
" 	Nerdtree
" ----------------------------------------------------------------------------------
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif 
	
	map <F6> :NERDTreeToggle<CR>

" ----------------------------------------------------------------------------------
" 	Auto Pairs
" ----------------------------------------------------------------------------------
	let g:AutoPairsFlyMode = 1

" ----------------------------------------------------------------------------------
" 	Vim-Header
" ----------------------------------------------------------------------------------
	let g:header_auto_add_header = 0
	let g:header_field_author = 'David Barcene'
	let g:header_field_author_email = 'david.barcene@utp.ac.pa'
	map <F4> :AddHeader<CR>

" ----------------------------------------------------------------------------------
"	Vimux
" ----------------------------------------------------------------------------------
	map <Leader>vp :VimuxPromptCommand<CR>

" ----------------------------------------------------------------------------------
"	Powerline
" ----------------------------------------------------------------------------------
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup
	set laststatus=2 " Always display the statusline in all windows
	set showtabline=2 " Always display the tabline, even if there is only one tab
	set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)
	set t_Co=256

"# =============================================================================== #
"#
"# 	GENERAl SETTINGS
"#
"# =============================================================================== #

	colorscheme jellybeans
	
	let g:jellybeans_overrides = {'background': { 'ctermbg': 'none', '256ctermbg': 'none' },}
	
	set encoding=utf-8
	set textwidth=120
	set rnu 
	set nocompatible
	set autoindent
	syntax on
	highlight Comment cterm=italic gui=italic
	set hidden

"	nnoremap <silent> vv <C-w>v	
	nnoremap <C-Left> :tabprevious<CR>
	nnoremap <C-Right> :tabnext<CR>
	:nnoremap j jzz
	:nnoremap k kzz
	:nnoremap G Gzz
	"split navigations | Uncomment these line if not using Plug 'christoomey/vim-tmux-navigator'
"	nnoremap <C-J> <C-W><C-J>
"	nnoremap <C-K> <C-W><C-K>
"	nnoremap <C-L> <C-W><C-L>
"	nnoremap <C-H> <C-W><C-H>


"# =============================================================================== #
"#
"# 	PYTHON
"#
"# =============================================================================== #

	au BufNewFile,BufRead *.py
		\ set tabstop=4 |
		\ set softtabstop=4 |
		\ set shiftwidth=4 |
		\ set textwidth=120 |
		\ set expandtab |
		\ set autoindent |
		\ set fileformat=unix

	let python_highlight_all=1
    	autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
    	autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>


