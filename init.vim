" My random, yet productive vim setup 
" Installation instructions because I have selective amnesia 
"
" pre-requisites 
"  1. vim-plug - A vim plugin manager
"     - vim-plug command to install. 
"     - curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"  2. fzf - fuzzy searcher, but is a commandline utility. 
"     - Either install fzf on the host OS, edit this line in the plugin list
"     - "Plug 'junegunn/fzf'
"       to 
"     - "Plug 'junegunn/fzf', {'dir' : '~/.fzf', 'do' : './install --all' }
" 
" Run this to install the plugins
" :PlugInstall
"
" Theoretically we should be good. 

syntax on
set number

call plug#begin(stdpath('data').'/plugged')
""" Version Control Software Plugins 
Plug 'tpope/vim-fugitive' " A git plugin
"Plug 'junegunn/gv.vim' " Frontend for the git plugin
Plug 'rbong/vim-flog' " Another frontend for git plugin

""" File & Buffer Management Plugins
Plug 'scrooloose/nerdtree' " Tree navigation
Plug 'xuyuanp/nerdtree-git-plugin' " Git status in the nerdtree
Plug 'junegunn/fzf' " Fuzzy finder support
Plug 'junegunn/fzf.vim' " vim frontend to fzf
Plug 'BurntSushi/ripgrep' " powerful recursive regex tool
" Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, tag, mru finder
"
" UI Tweaks
Plug 'vim-airline/vim-airline' " Fancy status bar


" Editing tweaks
Plug 'nathanaelkane/vim-indent-guides' " Indentation visual bars
Plug 'ap/vim-css-color' " css color previewer
Plug 'lambdalisue/suda.vim' " Sudo support for nvim
Plug 'scrooloose/nerdcommenter' " Makes commenting simpler

" Themes
Plug 'mhartington/oceanic-next' " Oceanic theme
Plug 'morhetz/gruvbox' " Gruvbox theme

" Language Packs
Plug 'elzr/vim-json' " Json better highlighting
" Plug 'sheerun/vim-polyglot' " Polygot language pack. Loads things on demand

call plug#end()

" Default Theme
colorscheme OceanicNext


let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "✹",
  \ "Staged"    : "✚",
  \ "Untracked" : "✭",
  \ "Renamed"   : "➜",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "✖",
  \ "Dirty"     : "✗",
  \ "Clean"     : "✔︎",
  \ 'Ignored'   : '☒',
  \ "Unknown"   : "?"
  \ }

" Indentation guide setup
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=grey
hi IndentGuidesEven ctermbg=lightgrey


" Let's create some leader key bindings
let mapleader = "\<Space>"


" Buffer control
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>
nnoremap <leader>bd :bd<CR>

" Window navigation
nnoremap <leader>wl <C-w><C-l>
nnoremap <leader>wh <C-w><C-h>
nnoremap <leader>wj <C-w><C-j>
nnoremap <leader>wk <C-w><C-k>
nnoremap <leader>ws <C-w><C-s>
nnoremap <leader>wv <C-w><C-v>
nnoremap <leader>wd <C-w><C-q>

" Tab navigation...we need to find a way to grab the count with an expression.
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt

" File navigation
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>ff :Files 
"nnoremap <leader>ff :CtrlP c<CR>
"let g:ctrlp_working_path_mode = 'cra'
"if executable('rg')
"  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
"endif

" keys we need to implement
" fuzzy file search
" countable expressions
" opening files quickly
" Sudo edit 
" symbols browser/jumper?
" line jumping & line view
" Hotkey browser(vim-which-key)
" Git keybinds
" Toggles for....
" - Numberlines
" - Relative numberlines
" Mass indentation
"
" Sudo editing macro
nnoremap <leader>fS :w suda://%<CR> " Saves current file as sudo
nnoremap <leader>fE :e suda://%<CR> " Opens current file for sudo writing


set tabstop=2
set shiftwidth=2
set expandtab
