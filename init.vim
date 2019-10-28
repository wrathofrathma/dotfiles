" vim-plug command to install. 
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" github with commands & relevant links
" https://github.com/junegunn/vim-plug
"


call plug#begin(stdpath('data').'/plugged')

Plug 'tpope/vim-fugitive' " A git plugin
"Plug 'junegunn/gv.vim' " Frontend for the git plugin
Plug 'rbong/vim-flog' " Another frontend for git plugin
Plug 'scrooloose/nerdtree' " Tree navigation
Plug 'xuyuanp/nerdtree-git-plugin' " Git status in the nerdtree
Plug 'scrooloose/nerdcommenter' " Makes commenting simpler
Plug 'vim-airline/vim-airline' " Fancy status bar
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, tag, mru finder
Plug 'nathanaelkane/vim-indent-guides' " Indentation visual bars
call plug#end()

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

nnoremap <leader>f :NERDTreeToggle<CR>

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



set tabstop=2
set shiftwidth=2
set expandtab
