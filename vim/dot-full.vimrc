set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
set rtp+=~/.fzf
set rtp+=/usr/local/opt/fzf
" Vundle let's you specify a plugin in a number of formats, but my favorite
" allows you to grab plugins straight off of github, just specify the bundle
" in the following format:
" Bundle 'githubUsername/repoName'

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'flazz/vim-colorschemes'
Bundle 'junegunn/fzf.vim'
Bundle 'tpope/vim-commentary'
Plugin 'reedes/vim-pencil'
Plugin 'fatih/vim-go'
Bundle 'vim-scripts/vis'
Bundle 'sheerun/vim-polyglot'
Bundle 'leshill/vim-json'
Bundle 'pangloss/vim-javascript'
Bundle 'indenthtml.vim'
Bundle 'tpope/vim-markdown'
Bundle 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'Chiel92/vim-autoformat'
Plugin 'nvie/vim-flake8'
Plugin 'tell-k/vim-autopep8'
Plugin 'pearofducks/ansible-vim'
Plugin 'rking/ag.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'chrisbra/csv.vim'
Plugin 'ledger/vim-ledger'
Plugin 'nathangrigg/vim-beancount'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sebdah/vim-delve'
Plugin 'dense-analysis/ale'
Plugin 'ambv/black'

" Fold the things
set foldmethod=syntax
set foldlevelstart=1

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

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --hidden --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" source ~/.base.vimrc

map <F5> :setlocal spell! spelllang=en_us<CR>
map <C-p> :FZF<CR>
" fzf files
map <C-p> :FZF<CR>

" NerdTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Flake8 Config
let g:flake8_show_in_file = 1

" This function will set Vim's background to "light" or "dark"
" depending on if the current color scheme Alacritty is using
" has those keywords in its name.
function! AlignBackground()
  let &background = ( system('alacritty-theme current') =~ "light" ? "light" : "dark" )
  hi Normal guibg=NONE ctermbg=NONE
endfunc


call AlignBackground()

"  don't f-with my comments when in python
au! FileType python setl nosmartindent
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<c-j>"
" " let g:UltiSnipsJumpForwardTrigger = "<tab>"
" "" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsListSnippets = '<c-l>'
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']
" g:UltiSnipsSnippetDirectories
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" We have to turn this stuff back on if we want all of our features.
filetype indent plugin on " Filetype auto-detection
syntax on " Syntax highlighting



" ALE SETUP
" let b:ale_terraform_tflint_executable =  "/Users/r638035/.local/bin/tflint"
let b:ale_linters = ['flake8', 'pylint', 'tflint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = {'python': ['black'], '*': ['remove_trailing_lines', 'trim_whitespace'], 'terraform': ['terraform', 'tflint']}

nmap <silent> <leader>k :ALENext<cr>     
nmap <silent> <leader>j :ALEPrevious<cr> 

" paste mode toggle
set pastetoggle=<F10>

" JavaScript Folding
let javascript_enable_domhtmlcss = 1
let b:javascript_fold = 1

" vim-go no fold
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"
let g:goimports = 1
" set t_Co=256                         " Enable 256 colors
" vim go                                 
let g:go_highlight_build_constraints = 1 
let g:go_highlight_extra_types = 1       
let g:go_highlight_fields = 1            
let g:go_highlight_functions = 1         
let g:go_highlight_methods = 1           
let g:go_highlight_operators = 1         
let g:go_highlight_structs = 1           
let g:go_highlight_types = 1             

" ledger
let g:ledger_bin = 'hledger'

" Airline settings
" always show status bar
let g:airline#extensions#ale#enabled = 1
set laststatus=2

autocmd VimEnter * hi Normal ctermbg=none


" THIS IS COLOR SETTINGS FOR TRUE COLOR thar be dragons
"set t_8f=^[[38;2;%lu;%lu;%lum        " set foreground color
"set t_8b=^[[48;2;%lu;%lu;%lum        " set background color
""
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors                    " Enable GUI colors for the terminal to get truecolor
let g:gruvbox_contrast_light='medium'
set background=light
colorscheme gruvbox

let g:airline_theme='gruvbox'
" Finally the color scheme. Choose whichever you want from the list in the
" link above (back up where we included the bundle of a ton of themes.)
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>
if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://sunaku.github.io/vim-256color-bce.html
    set t_ut=
endif
