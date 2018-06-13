
set nocompatible " Fuck VI... That's for grandpas.
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

set rtp+=~/tools/fzf
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" Let vundle manage itself:
Bundle 'gmarik/vundle'

" Just a shitload of color schemes.
" https://github.com/flazz/vim-colorschemes#current-colorschemes
Bundle 'flazz/vim-colorschemes'

" Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'junegunn/fzf.vim'

" Support for easily toggling comments.
Bundle 'tpope/vim-commentary'

" better text views
Plugin 'reedes/vim-pencil'
" go
Plugin 'fatih/vim-go'

" stuffs
Bundle 'vim-scripts/vis'
" indent + str(key)In addtion to the above plugins, you'll likely need some for individual
" non-standard syntaxes that aren't pre-bundled with vim. Here are some I use,
" these are required for me, but depending on what code you write, obviously
" this may differ for you.

" vim many syntax
Bundle 'sheerun/vim-polyglot'
" Proper JSON filetype detection, and support.
Bundle 'leshill/vim-json'

" vim already has syntax support for javascript, but the indent support is
" horrid. This fixes that.
Bundle 'pangloss/vim-javascript'

" vim indents HTML very poorly on it's own. This fixes a lot of that.
Bundle 'indenthtml.vim'

" I write markdown a lot. This is a good syntax.
Bundle 'tpope/vim-markdown'

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

" Supertab
Plugin 'ervandew/supertab' " silver searcher

" Fast grep
Plugin 'rking/ag.vim'

" Utlisnips
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" git goodness
Plugin 'tpope/vim-fugitive'

" git gutter w/ figitive
Plugin 'airblade/vim-gitgutter'

" csv things
Plugin 'chrisbra/csv.vim'

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

" source ~/.base.vimrc

" Ctrl-p conf
"let g:ctrlp_max_height = 30
"
"" follow symlinks
"let g:ctrlp_follow_symlinks = 1


map <C-p> :FZF<CR>
map <C-n> :NERDTreeToggle<CR>

" Flake8 Config
let g:flake8_show_in_file = 1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<c-t>"
" let g:UltiSnipsListSnippets="<c-t-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"



let g:SuperTabDefaultCompletionType = '<C-n>'
"  don't f-with my comments when in python
au! FileType python setl nosmartindent
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<tab>"
" " let g:UltiSnipsJumpForwardTrigger = "<tab>"
" "" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = '<s-tab>'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" g:UltiSnipsSnippetDirectories
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" We have to turn this stuff back on if we want all of our features.
filetype indent plugin on " Filetype auto-detection
syntax on " Syntax highlighting

" paste mode toggle
set pastetoggle=<F11>

" JavaScript Folding
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

source ~/.mega.vimrc

" Airline settings
" always show status bar
set laststatus=2
let g:airline_theme='solarized'
" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
set background=dark
colorscheme gruvbox




