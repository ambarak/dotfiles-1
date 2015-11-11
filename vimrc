" vim:fdm=marker
" @filename: ~/.vimrc

"---------- gvim
" I don't always use gvim, but when I do, I want it minimal.
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" Awesome font for coding, with a lot of useful icons.
" https://github.com/ryanoasis/nerd-fonts
set guifont=Sauce\ Code\ Powerline\ PNFT\ Mono

"---------- colors
" I  colors
syntax on
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" Default matching parent highlight is too visible.
" This is a more discrete highlight.
hi MatchParen cterm=bold ctermbg=grey ctermfg=black

"---------- vundle
set nocompatible              " required
filetype off                  " required

" Initialize Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"------ plugins {{{

Plugin 'tpope/vim-abolish'
Plugin 'ervandew/supertab'
Plugin 'benmills/vimux' " Run commands inside tmux window
"Plugin 'mhinz/vim-startify' " A fancy start screen for vim
"Plugin 'skammer/vim-swaplines' " Swap lines with ease
Plugin 'tpope/vim-fugitive' " git gui
Plugin 'Chiel92/vim-autoformat' " Provide easy code formatting in Vim by integrating existing code formatters.
Plugin 'scrooloose/syntastic.git' " check syntax
Plugin 'kien/ctrlp.vim' " Fuzzy file, buffer, mru, tag, etc finder.
Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline' " lean & mean status/tabline for vim that's light as air
Plugin 'scrooloose/nerdcommenter' " Vim plugin for intensely orgasmic commenting
Plugin 'godlygeek/tabular' " Vim script for text filtering and alignment. Note: must come before vim-markdown
Plugin 'terryma/vim-multiple-cursors' " True Sublime Text style multiple selections for Vim
Plugin 'bronson/vim-trailing-whitespace' " Highlights trailing whitespace in red and provides :FixWhitespace to fix it.
Plugin 'peterhoeg/vim-qml' " QML syntax highlighting for VIM
Plugin 'rdnetto/YCM-Generator' " Automatically generates YouCompleteMe configuration based on Makefile
Plugin 'scrooloose/nerdtree' " tree explorer
Plugin 'jreybert/vimagit' " Quick git commit
Plugin 'mhinz/vim-signify' " show diff in gutter
"Plugin 'c.vim' " C/C++
Plugin 'jszakmeister/vim-togglecursor' " Show different cursor for different modes (konsole support)
Plugin 'mattn/gist-vim' " vimscript for gist
Plugin 'fisadev/vim-ctrlp-cmdpalette' " fuzzy command search
Plugin 'rking/ag.vim' " the silver searcher
Plugin 'a.vim' " Alternate files quickly (header/implementation etc...)
Plugin 'sjl/gundo.vim' " Gundo is a Vim plugin for visualizing your undo tree to make it usable
Plugin 'rhysd/vim-clang-format' " Auto format with clang
Plugin 'kshenoy/vim-signature' " bookmark manager
Plugin 'octol/vim-cpp-enhanced-highlight' " smarter c++ highlight
Plugin 'SirVer/ultisnips' " Snippets engine
Plugin 'honza/vim-snippets' " Snippets are separated from the engine
Plugin 'Valloric/YouCompleteMe' " A code-completion engine for Vim
Plugin 'tpope/vim-dispatch' " build in bakcground
Plugin 'Raimondi/delimitMate' " automatically close quotes, parens, brackets, etc.
Plugin 'tpope/vim-surround' " surround.vim: quoting/parenthesizing made simple
Plugin 'tpope/vim-markdown'
"Plugin 'plasticboy/vim-markdown' " Markdown Vim Mode
Plugin 'reedes/vim-pencil' " Prose editing improved (markdown etc...)
Plugin 'ap/vim-css-color' " Preview colours in source code while editing
Plugin 'jaxbot/browserlink.vim' " like livereload
Plugin 'suan/vim-instant-markdown' " preview markdown in browser (needs `npm -g install instant-markdown-d`)
Plugin 'mattn/emmet-vim' " emmet for vim: http://emmet.io/
Plugin 'pangloss/vim-javascript' "
Plugin 'easymotion/vim-easymotion' " Vim motions on speed!
Plugin 'smarty-syntax' " Syntax highlight for Smarty Template Engine
Plugin 'tpope/vim-repeat' " repeat.vim: enable repeating supported plugin maps with .
Plugin 'tpope/vim-speeddating' " speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more
Plugin 'tpope/vim-unimpaired' " pairs of handy bracket mappings
Plugin 'tpope/vim-commentary' " Comment stuff out
" }}}

" vim-devicons must be loaded after all other plugins
" needs a good font with icons, like patched fonts you can find at
" https://github.com/ryanoasis/nerd-fonts
Plugin 'ryanoasis/vim-devicons' " Add fonts icons

" Plugins cannot be loaded below this line
call vundle#end()            " required
filetype plugin indent on    " required

"---------- autoreload vimrc on changes
" $MYVIMRC (~/.vimrc) and $MYGVIMRC (~/.gvimrc) must exists or an error will appear
augroup AutoreloadVimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc nested so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

"--------- general options

" turn off soft wrap
set nowrap

" this turns off physical line wrapping (ie: automatic insertion of newlines)
set textwidth=0 wrapmargin=0

" show columns at 80 and 120
set colorcolumn=80,120

" Indent automatically depending on filetype
filetype indent on
set autoindent

" yank to clipboard
set clipboard=unnamedplus

" When to start scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Show invisible characters
set listchars=eol:¬,tab:▸\ ,trail:·,nbsp:⎵
set list

" Prevent changing directory when opening files
set noautochdir

" Always show the sign (also called gutter)
augroup AlwaysShowTheSign
	autocmd BufEnter * sign define dummy
	autocmd BufEnter * execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
augroup END

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable mouse only in normal and visual mode.
" to disable: `set mouse=""`
set mouse=nv

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" With a powerful PC, we can have a huge history.
set history=8192

"--------- shortcuts {{{
" Change leader to a more efficient button
let mapleader = ","

" :W as :w
command! W  write

" Close buffers without pain
nnoremap <silent> <leader>w :bd<CR>
inoremap <silent> <leader>w :bd<CR>

" Save without pain
nnoremap <silent> <leader>s :w<CR>
inoremap <silent> <leader>s :w<CR>

" Paste from yank register. Because yes.
nnoremap <leader>p "0p
nnoremap <leader>P "0P

" Visual selection search
vnoremap // y/<C-R>"<CR>

" Visual selection search with the silver searcher
vnoremap <leader>f y:Ag '<C-r>"'<CR>

" Navigate marks with F2, like in SublimeText
map <F2> <Esc>]`

" next/prev buffer - Map ctrl+shift-left and ctrl+shift-right
" Note: konsole needs a remapping
"nnoremap [1;4D :e#<CR>
nnoremap [1;6D :bprevious<CR>
nnoremap [1;6C :bnext<CR>
" When switching buffer, exit from insert mode
"inoremap <ESC>[1;4D :e#<CR>
inoremap <ESC>[1;6D <ESC>:bprevious<CR>
inoremap <ESC>[1;6C <ESC>:bnext<CR>

" Disable ctrl-tab (konsole)
nnoremap [1;4D <Nop>
inoremap <ESC>[1;4D <Nop>

" Disable arrows and mouse wheel in insert mode
inoremap <silent> <ESC>OA <Nop>
inoremap <silent> <ESC>OB <Nop>
inoremap <silent> <ESC>OC <Nop>
inoremap <silent> <ESC>OD <Nop>

" Nerd Tree shortcut
nmap <leader>ne :NERDTreeToggle<cr>

" cltrp command palette
nmap <leader>: :CtrlPCmdPalette<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" show ag, the silver searcher
nnoremap <leader>f :Ag<space>

" Reindent all and return the same line where you were
nnoremap <leader>af :Autoformat<CR>

" Switch header/implementation (plugin a.vim)
nnoremap <F4> :A<CR>

" Switch to file under cursor (plugin a.vim)
nnoremap <F3> :IH<CR>

" Replace any parens pair with curly parens
:nnoremap <leader>{ %R}<Esc><C-o>R{<Esc>

" NERDTree
:let NERDTreeQuitOnOpen = 1

"---------- Ignore these files
" (apply to ctrlp if ctrlp_user_command isn't set)
set wildignore+=*/tmp/*
set wildignore+=*.so,*.o,*.d,*.gcda,*.gcno
set wildignore+=*.zip,*.tar,*.tar.gz,*.tar.bz2,*.tgz
set wildignore+=*.png,*.jpg,*.gif
set wildignore+=*/node_modules

"--------- ctrlp {{{
let g:ctrlp_map = '<C-p>' " If it's called ctrlp...
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_by_filename = 0 " 0: use full path, 1: use filename only
let g:ctrlp_switch_buffer = 'E' " Jump to the file with <CR>
let g:ctrlp_root_markers = ['.ycm_extra_conf.py', '.git', '.svn'] " ctrlp uses .git, .svn, ... as project root. Use these markers too

" Use ag, the silver searcher, for ctrlp search.
" Note: wildignore doesn't apply with this option, you need .agignore file
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" FIXME: I want ctrlp to give precedence to mru: when searching for a file,
" show first the mru.

"--------- Set Syntastic checkers {{{
" Note: checkers must be installed
let g:syntastic_javascript_checkers = ['jshint']

let g:syntastic_error_symbol=''
let g:syntastic_warning_symbol=''
let g:syntastic_style_error_symbol = ''
let g:syntastic_style_warning_symbol = ''

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"--------- signify
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=235  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=235 ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=235 ctermfg=227
let g:signify_update_on_bufenter = 1

"--------- Standard Vim settings {{{
set showcmd
set showmode
set title
set number " Show line number
set relativenumber " ...but show relative numbers except for the current line
set ruler " Show ruler on the statusline
set cursorline " Highlight current line
set hidden " Set hidden to allow buffers to be browsed
set incsearch " as I start to search, the file jumps to the match as I type.
set hlsearch " Highlight search results
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoread " Make Vim automatically open changed files
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " (Hopefully) removes the delay when hitting esc in insert mode
set tabstop=2 " The default is 8 which is MASSIVE!!
set shiftwidth=2 " indent by 2 spaces
set wildmenu " visually autocomplete the command menu
set lazyredraw " only redraw when needed
set ttyfast " sends more characters to the screen for fast terminal connections
set showmatch " highlight matching [{()}]
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 " 10 nested folders max
set nospell " Disable spell check
set virtualedit=onemore " Allow the cursor to move just past the end of the line
set smartcase "don't ignore Capitals when present
set splitright " ensures new splits are to the right of current
set tags=./.tags;,.tags; " tags files are hidden
set completeopt=menu,menuone " complete menu visibility
set shortmess=I " I: no intro message.
" }}}

" Silently execute external commands, without needing to redraw
command! -nargs=1 Silent
\ | execute ':silent !'.<q-args>
\ | execute ':redraw!'

"---------- Turn off swap files and backups

set noswapfile
set nobackup
set nowb

"---------- Markdown
augroup WrapLineInMarkdownFile
	autocmd!
	"autocmd FileType markdown setlocal formatoptions=nt
	autocmd FileType markdown setlocal wrapmargin=0
	autocmd FileType markdown setlocal textwidth=80
	autocmd FileType markdown setlocal wrap
	autocmd BufRead,BufNewFile *.md set filetype=markdown " Set extra filetypes
augroup END

"augroup Pencil
  "autocmd!
  "autocmd FileType markdown call pencil#init()
"augroup END

"---------- c.vim C/C++
let g:C_MapLeader  = '\' " All c.vim shortcuts with this leader
let g:clang_format#detect_style_file=1 " search for .clang-format file
let g:clang_format#auto_formatexpr=1 " Use clang as default formatter
let g:cpp_experimental_template_highlight=1
let g:cpp_class_scope_highlight=1

" Map some shortcuts only for C and CPP files
augroup Cpp
	autocmd BufRead,BufNewFile *.h set filetype=cpp " Set extra filetypes
	autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
	autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
	autocmd FileType c,cpp,objc nmap <Leader>C :ClangFormatAutoToggle<CR>
	" Refresh tags with ctags
	autocmd FileType cpp nnoremap <leader>R :Silent !ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q -I _GLIBCXX_NOEXCEPT -f .tags . <CR>
augroup END

" This script cd up until a Makefile is found, then call make.
set makeprg=~/.dotfiles/bin/make-closest-makefile

" F shortcuts
nnoremap <F8> <Esc>:update<CR>:VimuxRunLastCommand<CR> " Run last vimux command
" FIXME: <F9> is doing something... what???
nnoremap <F11> <Esc>:update<CR>:Make!<CR> " Make in background
nnoremap <F12> <Esc>:update<CR>:Make<CR> " Make in foreground

" Like F8, less painful
nmap zzz <F8>

" Like F12, less painful
nmap zz <F12>

" Refresh Signify
nnoremap <leader>RS :SignifyRefresh<CR>

"---------- the silver search
let g:ag_working_path_mode="r" " Search in project directory

"---------- Snippets and YouCompleteMe
let g:ycm_confirm_extra_conf = 0 " load local ycm configuration silently.
let g:ycm_use_ultisnips_completer = 0 " Disable UltiSnips for YCM

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"--------- airline

" the theme
let g:airline_theme='pez' " Sometime this does not work... why?
au VimEnter * AirlineTheme pez " Fix for the above

" always show statusbar
set laststatus=2

" Enable the list of buffers (statusline, bottom)
let g:airline#extensions#bufferline#enabled = 1

" Enable the list of tabs (tabline, top)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'
let g:airline#extensions#tabline#fnametruncate = 16
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" populate the g:airline_symbols dictionary with the powerline symbols
let g:airline_powerline_fonts = 1

" Enable syntastic
let g:airline#extensions#syntastic#enabled = 1
let g:syntastic_mode_map = {
		\ "mode": "passive",
		\ "active_filetypes": [],
		\ "passive_filetypes": [] }

" Disable echo of current buffer in commandline
let g:bufferline_echo = 0

"---------- vimux
let g:VimuxOrientation = "h"

"---------- web
" Enable browserlink livereload for these types:
let g:bl_pagefiletypes = ['html', 'javascript', 'php']
augroup Css
	autocmd!
	autocmd FileType css setlocal expandtab
augroup END

augroup Xml
	autocmd!
	autocmd FileType xml setlocal expandtab
augroup END

augroup Javascript
	autocmd!
	autocmd FileType javascript setlocal expandtab
  let g:formatterpath = [ $NVM_BIN . '/js-beautify' ]
augroup END

augroup PHP
	autocmd!
	autocmd FileType php setlocal expandtab
augroup END

"---------- qml
augroup QML
	autocmd!
	autocmd FileType qml setlocal expandtab
augroup END

"------------------------------------------------------------------------------
" Include local vimrc
if filereadable(glob("~/.vimrc.local"))
	source ~/.vimrc.local
endif