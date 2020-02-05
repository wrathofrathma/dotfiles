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
" TODO 
" Add a todo-list manager or org-mode style plugin
" Git control keybindings
" better file management keybindings.
" keybindings for vim repeat and the one that edits braces
"
" ----------------- Plugins ------------------------- "
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
" Plug 'wincent/command-t' " File stuff

" UI Tweaks
Plug 'vim-airline/vim-airline' " Fancy status bar
Plug 'liuchengxu/vim-which-key' " Pop up guidef or available hotkeys.

" Editing tweaks
Plug 'yggdroot/indentline' " Softer indentation
Plug 'tpope/vim-surround' " Makes surrounding things with quotes and stuff easier.
Plug 'ap/vim-css-color' " css color previewer
Plug 'lambdalisue/suda.vim' " Sudo support for nvim
Plug 'scrooloose/nerdcommenter' " Makes commenting simpler

" Themes
Plug 'mhartington/oceanic-next' " Oceanic theme
Plug 'morhetz/gruvbox' " Gruvbox theme
Plug 'fcpg/vim-orbital' " orbital theme
Plug 'christophermca/meta5'
Plug 'dracula/vim'
Plug 'calincru/peaksea.vim'

" Language Packs
Plug 'neoclide/coc.nvim', {'branch' : 'release'} "  Intellisense engine for neovim. Requires an LSP.
Plug 'elzr/vim-json' " Json better highlighting
Plug 'mattn/emmet-vim' " HTML Expansion using visual highlighting and vim commands.
" Plug 'sheerun/vim-polyglot' " Polygot language pack. Loads things on demand
Plug 'donRaphaco/neotex', { 'for' : 'tex' }  " Live preview for Latex

" Utility
Plug 'tpope/vim-repeat' " Allows for repeating a command some number of times in functions.
Plug 'vimwiki/vimwiki' " Personal wiki inside of vim. Currently being used for notes and todo mostly.
call plug#end()
" ---------------- Vim config stuff ------------------- "
" ----- Bells and whistles ----- "
syntax on " Syntax highlighting
set ignorecase " Ignores case when searching 
set smartcase " When searching, try to be smart about cases. 
set hlsearch " Highlight search results
set noerrorbells
set novisualbell
set encoding=utf8
set ffs=unix,dos,mac
set textwidth=160
set cmdheight=1 " Change this if we need a bigger command buffer height
set signcolumn=yes " Always display signcolumns(mostly for git)
set nocompatible
set number
filetype plugin on
set updatetime=100 "Relevant to the leader key menu popping up quickly.
set splitright " This and splitbelow define split behavior. 
set splitbelow

" ----- Performance tuning ----- "
" TODO - Autocmd grouping for our stuff. Maybe if we do that or clear a bunch of them from plugins we can improve performance
" Don't redraw during macro executions
set lazyredraw
set noswapfile
set nowb
set nobackup
" Disable syntax highlighting for files >1M
autocmd Filetype * if getfsize(@%) > 1000000 | setlocal syntax=off | endif

" ----- Tab settings ----- "
set tabstop=2
set shiftwidth=2
set expandtab


let g:python_recommended_style = 0
" ----------------- MACOS specific config -------------- "
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif
if has("macunix")
    set rtp+=$(brew --prefix)/opt/fzf
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

" --------------- Theme config ------------------------- "
" Default Theme
colorscheme meta5
"hi Normal guibg=None ctermbg=None
"hi NonText guibg=None ctermbg=None
" ------------------------------------------------------- "

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


" --------------- Plugin config ------------------------ "
let g:vimwiki_list = [{'path':'~/.vimwiki/'}]
      "\ 'syntax': 'markdown','ext' : '.md'}]

"autocmd! FileType which_key
"autocmd  FileType which_key set laststatus=0 noshowmode noruler
"  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
"""""""""""""""""""" WHICH KEY CONFIG & KEYBINDNIGS ------------------------------------
let mapleader = "\<Space>" " Defining space as our map leader. 
call which_key#register('<Space>',"g:which_key_map")
vnoremap <silent><leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>
set timeoutlen=200


" Defining our keymaps for which-key 
let g:which_key_map = {}
" In order to define sub-menu mappings, we need to define the top-level maps 
let g:which_key_map.a = { 'name' : '+applications'}
let g:which_key_map.b = { 'name' : '+buffer'}
let g:which_key_map.c = { 'name' : '+comment'}
let g:which_key_map.e = { 'name' : '+editor'}
let g:which_key_map.f = { 'name' : '+file'}
let g:which_key_map.g = { 'name' : '+git'}
let g:which_key_map.n = { 'name' : '+notes'}
let g:which_key_map.t = { 'name' : '+tab'}
let g:which_key_map.w = { 'name' : '+window'}

" Buffer control
nnoremap <leader>bn :bn<CR>
let g:which_key_map.b.n = 'Next buffer'
nnoremap <leader>bp :bp<CR>
let g:which_key_map.b.p = 'Previous buffer'
nnoremap <leader>bd :bd<CR>
let g:which_key_map.b.d = 'Delete buffer'

" Wiki control
nmap <silent><unique> '.s:map_prefix.'d <Plug>VimwikiDeleteLink
nmap <silent><unique> '.s:map_prefix.'t <Plug>VimwikiTabIndex
nmap <silent><unique> '.s:map_prefix.'w <Plug>VimwikiIndex
nmap <silent><unique> '.s:map_prefix.'s <Plug>VimwikiUISelect
nmap <silent><unique> '.s:map_prefix.'i <Plug>VimwikiDiaryIndex
nmap <silent><buffer> '.vimwiki#vars#get_global('map_prefix').'d <Plug>VimwikiDeleteLink
nmap <silent><buffer> '.vimwiki#vars#get_global('map_prefix').'r <Plug>VimwikiRenameLink
nnoremap <leader>nw :VimwikiIndex<CR> " Opens default wiki index file.
nnoremap <leader>nt :VimwikiTabIndex<CR> " Opens default wiki index file in a new tab.
nnoremap <leader>ns :Rg ~/.vimwiki<CR>
nnoremap <leader>nf :Files ~/.vimwiki<CR>
autocmd Filetype vimwiki nnoremap <leader>nd :VimwikiDeleteLink<CR>
autocmd Filetype vimwiki nnoremap <leader>nr :VimwikiRenameLink<CR>
let g:which_key_map.n.w = 'Open notes index'
let g:which_key_map.n.t = 'Open notes index in tab'
let g:which_key_map.n.s = 'Search notes'
autocmd Filetype vimwiki let g:which_key_map.n.d = 'Delete note'
autocmd Filetype vimwiki let g:which_key_map.n.r = 'Rename note'
let g:which_key_map.n.f = 'Find note'

"" Window navigation
nnoremap <leader>wl <C-w><C-l>
let g:which_key_map.w.l = 'Right window'
nnoremap <leader>wh <C-w><C-h>
let g:which_key_map.w.h = 'Left window'
nnoremap <leader>wj <C-w><C-j>
let g:which_key_map.w.j = 'Down window'
nnoremap <leader>wk <C-w><C-k>
let g:which_key_map.w.k = 'Up window'
nnoremap <leader>ws <C-w><C-s>
let g:which_key_map.w.s = 'Split horizontally'
nnoremap <leader>wv <C-w><C-v>
let g:which_key_map.w.v = 'Split vertically'
nnoremap <leader>wd <C-w><C-q>
let g:which_key_map.w.d = 'Delete window'
nnoremap <leader>wr <C-w>R
let g:which_key_map.w.r = 'Reverse windows'

"" Tab control 
nnoremap <leader>tc :tabnew<CR> 
let g:which_key_map.t.c = 'Create tab'
nnoremap <leader>td :tabclose<CR>
let g:which_key_map.t.d = 'Delete tab'
nnoremap <leader>tn :tabnext<CR>
let g:which_key_map.t.n = 'Next tab'
nnoremap <leader>tp :tabprevious<CR>
let g:which_key_map.t.p = 'Previous tab'

"" Tab navigation...we need to find a way to grab the count with an expression.
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
let g:which_key_map.t.1 = 'First tab'
let g:which_key_map.t.2 = 'Second tab'
let g:which_key_map.t.3 = 'Third tab'
let g:which_key_map.t.4 = 'Fourth tab'

" File navigation
nnoremap <leader>ft :NERDTreeToggle<CR>
let g:which_key_map.f.t = 'Toggle file tree'
nnoremap <leader>ff :Files 
let g:which_key_map.f.f = 'Find file'

" Git Control with Fugitive
"nnoremap <leader>gf :Gfetch<CR>
"nnoremap <leader>gp :Gpull<CR>
"nnoremap <leader>gb :Gblame<CR>
"nnoremap <leader>gm :Gmerge<CR>
"nnoremap <leader>gc :Gcommit<CR>

" Git gutter settings
let g:gitgutter_max_signs = 500 " Default value. 

" Open the config
nnoremap <leader>ec :e $MYVIMRC<CR>
nnoremap <leader>eC :Colors<CR>
let g:which_key_map.e.c = "Open config"
let g:which_key_map.e.C = "Select colorscheme"


"" Application bindings 
nnoremap <leader>at :terminal<CR>
tnoremap <A-q> <C-\><C-n> " Terminal binding to escape terminal
let g:which_key_map.a.t = 'Open terminal'

" Nerd commenter settings
let g:which_key_map.c.t = 'Toggle comment'
let g:which_key_map.c.i = 'Invert comment' 
let g:which_key_map.c.y = 'Yank & comment' 
let g:which_key_map.c.s = 'Sexy comment' 
let g:which_key_map.c['$'] = 'Comment to EOL' 
let g:which_key_map.c[' '] = 'Comment' 
let g:which_key_map.c.c = 'Comment' 
let g:which_key_map.c.u = 'Uncomment' 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
"nnoremap <leader>fS :w suda://%<CR> " Saves current file as sudo
"nnoremap <leader>fE :e suda://%<CR> " Opens current file for sudo writing


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
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)

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
"nmap <leader>rn <Plug>(coc-rename)

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
