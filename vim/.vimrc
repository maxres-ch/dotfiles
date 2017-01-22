" Initial work by:
" v0.1 2012-10-22 Philip Thrasher
"

set nocompatible " Fuck VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Bundle 'gmarik/vundle'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'

Bundle 'ctrlpvim/ctrlp.vim'

" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'

" In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.

" Proper JSON filetype detection, and support.
Bundle 'leshill/vim-json'

" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Bundle 'pangloss/vim-javascript'

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Bundle 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Bundle 'tpope/vim-markdown'

" LessCSS -- I use this every day.
Bundle 'groenewege/vim-less'

" File Browser
Bundle 'scrooloose/nerdtree'

" Syntax Checker
Plugin 'scrooloose/syntastic'

" Autofrmatter
Plugin 'Chiel92/vim-autoformat'

" PEP8
Plugin 'nvie/vim-flake8'
" Autoflake
Plugin 'tell-k/vim-autopep8'
" Ansible
Plugin 'pearofducks/ansible-vim'
" Powerline
Plugin 'powerline/powerline'

" YCM
Plugin 'Valloric/YouCompleteMe'

" Rope
" Bundle 'python-rope/ropevim'

" Supertab
Plugin 'ervandew/supertab'

" Utlisnips
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'


" git goodness
Plugin 'tpope/vim-fugitive'

" Fold the things
set foldmethod=syntax
set foldlevelstart=1
" Vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Python Folding
Plugin 'tmhedberg/SimpylFold'
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

" Kill trailing white space
nnoremap <silent> <F2> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:ultisnips_python_style="sphinx"
" We have to turn this stuff back on if we want all of our features.
filetype plugin indent on " Filetype auto-detection
syntax on " Syntax highlighting
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab " use spaces instead of tabs.
set smarttab " let's tab key insert 'tab stops', and bksp deletes tabs.
set shiftround " tab / shifting moves to closest tabstop.
set autoindent " Match indents on new lines.
set smartindent " Intellegently dedent / indent new lines based on rules.

" We have VCS -- we don't need this stuff.
set nobackup " We have vcs, we don't need backups.
set nowritebackup " We have vcs, we don't need backups.
set noswapfile " They're just annoying. Who likes them?

" don't nag me when hiding buffers
set hidden " allow me to have buffers with unsaved changes.
set autoread " when a file has changed on disk, just load it. Don't ask.

" Make search more sane
set ignorecase " case insensitive search
set smartcase " If there are uppercase letters, become case-sensitive.
set incsearch " live incremental searching
set showmatch " live match highlighting
set hlsearch " highlight matches
set gdefault " use the `g` flag by default.

" No wrap
set nowrap

" allow the cursor to go anywhere in visual block mode.
set virtualedit+=block

" leader is a key that allows you to have your own "namespace" of keybindings.
" You'll see it a lot below as <leader>
let mapleader = ","


" So we don't have to press shift when we want to get into command mode.
nnoremap ; :
vnoremap ; :

noremap <F3> :Autoformat<CR>

" So we don't have to reach for escape to leave insert mode.
inoremap jf <esc>

" create new vsplit, and switch to it.
noremap <leader>v <C-w>v

" bindings for easy split nav
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Use sane regex's when searching
nnoremap / /\v
vnoremap / /\v

" Clear match highlighting
noremap <leader><space> :noh<cr>:call clearmatches()<cr>

" Quick buffer switching - like cmd-tab'ing
nnoremap <leader><leader> <c-^>


" Visual line nav, not real line nav
" If you wrap lines, vim by default won't let you move down one line to the
" wrapped portion. This fixes that.
noremap j gj
noremap k gk

" Plugin settings:
" Below are some 'sane' (IMHO) defaults for a couple of the above plugins I
" referenced.

" Map the key for toggling comments with vim-commentary
nnoremap <leader>c <Plug>CommentaryLine

" Remap ctrlp to ctrl-t -- map it however you like, or stick with the
" defaults. Additionally, in my OS, I remap caps lock to control. I never use
" caps lock. This is highly recommended.
let g:ctrlp_map = '<c-p>'

" Let ctrlp have up to 30 results.
let g:ctrlp_max_height = 30

" Better file manager mapping
map <C-n> :NERDTreeToggle<CR>

" YCM goto fun
nnoremap <leader>jd :YcmCompleter GoTo<CR>
nnoremap <leader>hd :YcmCompleter GoToDefinition<CR>

" Set YCM Interpreter
let g:ycm_server_python_interpreter=$YCM_PYTHON

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<c-t>"
"let g:UltiSnipsListSnippets="<c-t-l>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
" don't f-with my comments when in python
au! FileType python setl nosmartindent
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" We have to turn this stuff back on if we want all of our features.
filetype indent plugin on " Filetype auto-detection
syntax on " Syntax highlighting


" JavaScript Folding
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

" Airline settings
" always show status bar
set laststatus=2

" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
" set background=light
colorscheme badwolf
