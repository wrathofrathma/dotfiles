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
"  3. ripgrep
"  4. nvim-python
" 
" Run this to install the plugins
" :PlugInstall
"
" Theoretically we should be good. 

syntax on
set number
set textwidth=160
set cmdheight=1 " Change this if we need a bigger command buffer height
set signcolumn=yes " Always display signcolumns

set tabstop=2
set shiftwidth=2
set expandtab
set updatetime=100
set splitright
set splitbelow

call plug#begin(stdpath('data').'/plugged')
""" Version Control Software Plugins 
Plug 'tpope/vim-fugitive' " A git plugin
Plug 'junegunn/gv.vim' " Git commit browser. Depends on fugitive
Plug 'airblade/vim-gitgutter' " Git diff browser in the gutter

"Plug 'rbong/vim-flog' " Another frontend for git plugin

""" File & Buffer Management Plugins
Plug 'scrooloose/nerdtree' " Tree navigation
Plug 'xuyuanp/nerdtree-git-plugin' " Git status in the nerdtree doesn't seem to be working.
Plug 'junegunn/fzf' " Fuzzy finder support
Plug 'junegunn/fzf.vim' " vim frontend to fzf
Plug 'BurntSushi/ripgrep' " powerful recursive regex tool
" Plug 'ctrlpvim/ctrlp.vim' " Fuzzy file, buffer, tag, mru finder
"Plug 'wincent/command-t' " File stuff

"Plug 'Yggdroot/LeaderF' " Testing a fuzzy search thing. Meh. fzf is simpler. 


"
" UI Tweaks
Plug 'vim-airline/vim-airline' " Fancy status bar
Plug 'liuchengxu/vim-which-key' " Pop up guidef or available hotkeys.

" Editing tweaks
" Plug 'nathanaelkane/vim-indent-guides' " Indentation visual bars. I dislike this one due to the harsh lines. It doesn't really fit in any colorscheme. 
Plug 'yggdroot/indentline' " Softer indentation
Plug 'tpope/vim-surround' " Makes surrounding things with quotes and stuff easier.
Plug 'ap/vim-css-color' " css color previewer
Plug 'lambdalisue/suda.vim' " Sudo support for nvim
Plug 'scrooloose/nerdcommenter' " Makes commenting simpler

" Themes
Plug 'mhartington/oceanic-next' " Oceanic theme
Plug 'morhetz/gruvbox' " Gruvbox theme

" Language Packs
Plug 'neoclide/coc.nvim', {'branch' : 'release'} "  Intellisense engine for neovim. Requires an LSP.

Plug 'elzr/vim-json' " Json better highlighting
Plug 'mattn/emmet-vim' " HTML Expansion using visual highlighting and vim commands.
" Plug 'sheerun/vim-polyglot' " Polygot language pack. Loads things on demand
Plug 'donRaphaco/neotex', { 'for' : 'tex' }  " Live preview for Latex
" Utility
Plug 'tpope/vim-repeat' " Allows for repeating a command some number of times in functions.
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


" Indentline setup options. Going with default for now
"let g:indentLine_char = 'c'
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_conceallevel=2
"let g:indentLine_setConceal=0

" Old indentation setup
"let g:indent_guides_enable_on_vim_startup = 1
"let g:indent_guides_auto_colors = 0
"hi IndentGuidesOdd ctermbg=grey
"hi IndentGuidesEven ctermbg=lightgrey


" Let's create some leader key bindings
let mapleader = "\<Space>"

nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=500

" Defining our keymap for which-key 
let g:which_key_map = {}
let g:which_key_map.f = { 'name' : '+files' }
" In order to define sub-menu mappings, we need to define the top-level maps 
"let g:which_key_map.f = {
"  \ 'name' : '+file',
"  \ 'f' : [ 'ff', 'Find File' ],
"  \}

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
nnoremap <leader>wr <C-w>R

" Split size control 
nnoremap <leader>sh= 10<C-w>+
nnoremap <leader>sh- 10<C-w>-
nnoremap <leader>sw= 10<C-w><
nnoremap <leader>sw- 10<C-w>>
nnoremap <leader>ss= <C-w>=

" Tab control 
nnoremap <leader>tc :tabnew<CR> 
nnoremap <leader>td :tabclose<CR>
nnoremap <leader>tn :tabnext<CR>
nnoremap <leader>tp :tabprevious<CR>

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

" Git Control with Fugitive
nnoremap <leader>gf :Gfetch<CR>
nnoremap <leader>gp :Gpull<CR>
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gm :Gmerge<CR>
nnoremap <leader>gc :Gcommit<CR>

" Git gutter settings
let g:gitgutter_max_signs = 500 " Default value. 

" Open the config
nnoremap <leader>ec :e $MYVIMRC<CR>


" Application bindings 
nnoremap <leader>at :terminal<CR>
tnoremap <A-q> <C-\><C-n> " Terminal binding to escape terminal

" TODO 
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
" Check coc extensions
" Maybe plugins
" Startify
" devicons
" Nerdtree git
" ctrlp vs fzf
" devdocs.io support 
" ultisnips
"
" Sudo editing macro
nnoremap <leader>fS :w suda://%<CR> " Saves current file as sudo
nnoremap <leader>fE :e suda://%<CR> " Opens current file for sudo writing


"""" COC Default config stuff. We need to edit this to fit our needs

" Tab for coc completion with characters ahead. 
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Using CocList
" Show all diagnostics
"nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
