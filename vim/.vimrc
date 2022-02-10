" This is Alek Monstovich's .vimrc file
" vim:set ts=2 sts=2 sw=2 expandtab

silent! if plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf',        { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" UI
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'ap/vim-css-color'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'arcticicestudio/nord-vim'
Plug 'wincent/terminus'

" Edit
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'jiangmiao/auto-pairs'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-sleuth'
Plug 'lifepillar/vim-mucomplete'

" Browsing
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jgdavey/vim-turbux'
Plug 'benmills/vimux'
Plug 'sjl/gundo.vim'
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerdLoader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerdLoader'
        \| endif
augroup END

if v:version >= 703
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle'      }
endif

" Git
Plug 'tpope/vim-fugitive'
Plug 'rbong/vim-flog'
if v:version >= 703
  Plug 'mhinz/vim-signify'
endif

" Lang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
Plug 'Rip-Rip/clang_complete'
Plug 'chase/vim-ansible-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-bundler'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'lyuts/vim-rtags', { 'for': ['c', 'cpp'] }
Plug 'rust-lang/rust.vim'

" Lint
Plug 'w0rp/ale'

call plug#end()
endif

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
syntax on                       " Turn on syntax highlighting
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set modelines=0
set shortmess=atI               " Don't show the intro message when starting vim
set ttyfast                     " Indicate fast terminal conn for faster redraw
set mouse=a                     " Enable mouse in all modes
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8 nobomb       " Set default encoding to UTF-8 without BOM
set termencoding=utf-8          " Set terminal encoding to UTF-8
set fileencoding=utf-8          " Set file default encoding to UTF-8
set fileencodings=utf8,cp1251   " Set encodings order
set autoread                    " Automatically read changed files
set autowrite                   " Automatically save before :next, :make etc.
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set nowb                        " No write backup
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set nostartofline               " Don't reset cursor to start of line when moving around.
set ruler                       " Show the cursor position
set synmaxcol=800               " Don't try to highlight lines longer than 800 characters
set hidden                      " Buffer should still exist if window is closed
set history=1000                " Remember more commands and search history
set undolevels=200              " Use muchos levels of undo
set viminfo='100,f1             " Save up to 100 marks, enable capital marks
set gcr=a:blinkon0              " Disable cursor blink
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set showmatch                   " Show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
"set complete=.,b,u,]
set completeopt-=preview
set completeopt+=menu,menuone   " Show popup menu, even if there is one entry
set completeopt+=noinsert,noselect,longest
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set novisualbell                " No sounds
set noerrorbells                " Disable error bells
set shiftround                  " Use multiple of shiftwidth when indenting with '<' and '>'
set softtabstop=2
set autoindent                  " Enabile Autoindent
set smartindent
set smarttab
set tabstop=2                   " Make tabs as wide as two spaces
set shiftwidth=2
set expandtab
set showtabline=1               " Show only if there is two tabs
set t_ti= t_te=                 " Prevent Vim from clobbering the scrollback buffer
set grepprg=ack                 " Set grep to ack
set notimeout                   " Time out on key codes but not mappings.
set ttimeout                    " Basically this makes terminal Vim work sanely.
set ttimeoutlen=10
set wrap                        " wrap the lines
"set nowrap                      " Don't wrap lines
set linebreak                   " Wrap lines at convenient points
set cmdheight=2                 " Better display for messages
set updatetime=300              " Smaller updatetime for CursorHold & CursorHoldI
set signcolumn=yes              " Always show sign column


au VimResized * :wincmd =       " Resize splits when the window is resized
"if exists("&relativenumber")    " Never use relative line numbers
"	set norelativenumber
"	au BufReadPost * set norelativenumber
"endif

" Show "invisible" characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
" Display tabs and trainling spacing visually
set list listchars=tab:▸\ ,trail:·,eol:¬
set list
set fillchars=diff:⣿,vert:\ 

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


""""""""""""""""""""""
"     Scrolling      "
""""""""""""""""""""""
set scrolloff=8                 " Keep more context when scrolling off
set sidescrolloff=15            " ... the end of a buffer
set sidescroll=1
set shortmess+=c                " Shut off completion messages
set belloff+=ctrlg              " If Vim beeps during completion
set wildmenu                    " Enhance command-line completion
set wildmode=longest,list:longest
set esckeys                     " Allow cursor keys in insert mode
set gdefault                    " Add the g flag to search/replace by default
set binary                      " Don't add empty newlines at the end of files
set noeol

""""""""""""""""""""""
"       Folds        "
""""""""""""""""""""""
"set foldmethod=indent           " Fold based on indent
set foldmethod=manual           " This solved for me the issue with the coc plugin
set foldnestmax=3               " Deepest fold is 3 levels
set nofoldenable                " Don't fold by default

""""""""""""""""""""""
"    Colorscheme     "
""""""""""""""""""""""
syntax enable
set termguicolors

let g:rehash256 = 1
let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
let g:nord_uniform_status_lines = 1
let g:nord_cursor_line_number_background = 1
set background=dark
colorscheme nord

" Color Changes
hi LineNr                    ctermfg=green   ctermbg=black
hi NERDTreeCWD               ctermfg=black
hi NERDTreeLink              ctermfg=cyan
hi NERDTreeExecFile          ctermfg=green
hi SyntasticStyleWarningSign ctermfg=yellow  ctermbg=black
hi SyntasticStyleErrorSign   ctermfg=red     ctermbg=black
hi SyntasticWarningSign      ctermfg=yellow  ctermbg=black
hi SyntasticErrorSign        ctermfg=red     ctermbg=black
hi SignColumn                ctermbg=black
hi GitGutterAdd              ctermfg=green   ctermbg=black
hi GitGutterChange           ctermfg=yellow  ctermbg=black
hi GitGutterDelete           ctermfg=red     ctermbg=black
hi GitGutterChangeDelete     ctermfg=blue    ctermbg=black
hi vertsplit                 ctermfg=green   ctermbg=green
hi Pmenu                                     ctermbg=238
hi clear SignColumn

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","
let maplocalleader = ";"

map <leader>y "*y

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

imap <c-c> <esc>
imap <C-k> <Esc>
imap <C-K> <Esc>
imap jj <Esc>

nnoremap <leader><leader> <c-^>

" Cycle through relativenumber + number, number (only), and no numbering
function! CycleNumbering() abort
  if exists('+relativenumber')
    execute {
	  \ '00': 'set relativenumber   | set number',
	  \ '01': 'set norelativenumber | set number',
	  \ '10': 'set norelativenumber | set nonumber',
	  \ '11': 'set norelativenumber | set number' }[&number . &relativenumber]
  else
    " No relative numbering, just toggle numbers on and off.
    set number!<CR>
  endif
endfunction
nnoremap <silent> <Leader>n :call CycleNumbering()<CR>

" Insert a hash rocket with <c-l>
imap <c-l> <space>=><space>

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Act like D and C
nnoremap Y y$

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

" Treat .json files as .js
autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
autocmd filetype html,xml set listchars-=tab:>.

" Auto clear fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" Strip trailing whitespace (,ss)
function! StripWhiteSpace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhiteSpace()<CR>

" Save file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>vv :view %%


"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_auto_type_info = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup go
  autocmd!

  compiler go

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <F9> :GoCoverageToggle -short<cr>

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

	" TagBar configuration for Golang
	let g:tagbar_type_go = {
		\ 'ctagstype' : 'go',
		\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
		\ ],
		\ 'sro' : '.',
		\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
		\ },
		\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
		\ },
		\ 'ctagsbin'  : 'gotags',
		\ 'ctagsargs' : '-sort -silent'
	\ }

augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" gundo
nnoremap <F6> :GundoToggle<cr>

" nerdtree
map <leader>o :NERDTreeToggle<cr>
let g:NERDTreeShowHidden = 1    " Show hidden files/directories
let g:NERDTreeMinimalUI = 1     " Remove bookmarks and help text from NERDTree

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" git
nnoremap <leader>l :Shell git gl -18<cr>:wincmd \|<cr>

" ctrlp
map <leader>f :CtrlP<cr>
map <leader>m :CtrlPMixed<cr>
map <F5> :CtrlPClearCache<cr>
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" tagbar
nmap <F8> :TagbarToggle<CR>

" easymotion
let g:EasyMotion_leader_key = '<LocalLeader>'

" ale
let g:ale_sign_error = '⤫'      " Error
let g:ale_sign_warning = '⚠'    " and warning signs
let g:ale_linters = {'go': ['gometalinter']}

"+--- Yggdroot/indentLine ---+
let g:indentLine_enabled = 0
let g:indentLine_char = '│'

"+--- itchyny/lightline.vim ---+
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'fugitive', 'filename' ]
      \   ]
      \ },
      \ 'inactive': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'filename' ]
      \   ],
      \   'right': [
      \   ],
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \   'readonly': 'LightlineReadonly',
      \   'modified': 'LightlineModified',
      \   'filename': 'LightlineFilename'
      \ },
      \ 'separator': {
      \   'left': '',
      \   'right': ''
      \ },
      \ 'subseparator': {
      \   'left': '',
      \   'right': ''
      \ }
    \ }

function! LightlineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightlineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return ""
  else
    return ""
  endif
endfunction

function! LightlineFugitive()
  if exists("*fugitive#head")
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

"""""""""""""""""""""
"       Misc        "
"""""""""""""""""""""

" Clear the search buffer when hitting return
function! MapCR()
  nnoremap <cr> :nohlsearch<cr>
endfunction
call MapCR()


"""""""""""""""""""""
"  Auto-completion  "
"""""""""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = {}
let g:mucomplete#chains.default  = ['path', 'omni', 'keyn', 'dict', 'uspl', 'ulti']
let g:mucomplete#chains.markdown = ['path', 'keyn', 'dict', 'uspl']
let g:mucomplete#chains.vim      = ['path', 'keyn', 'dict', 'uspl']

"""""""""""""""""""""
"        UI         "
"""""""""""""""""""""
highlight Comment cterm=italic