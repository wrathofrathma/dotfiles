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
"  4. ctags
"  5. pip3 install neovim
"  6. pip2 install neovim
"  7. pip install isort
"  8. Optional: powerline fonts
"  The rest should auto-install when you open related files or do related tasks
"
" Run this to install the plugins
" :PlugInstall
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

" UI Tweaks
Plug 'vim-airline/vim-airline' " Fancy status bar
Plug 'vim-airline/vim-airline-themes'
Plug 'liuchengxu/vim-which-key' " Pop up guidef or available hotkeys.
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'

" Editing tweaks
Plug 'yggdroot/indentline' " Softer indentation
Plug 'tpope/vim-surround' " Makes surrounding things with quotes and stuff easier.
Plug 'ap/vim-css-color' " css color previewer
Plug 'lambdalisue/suda.vim' " Sudo support for nvim
Plug 'scrooloose/nerdcommenter' " Makes commenting simpler
Plug 'SirVer/ultisnips' " Snippets engine
Plug 'honza/vim-snippets' " Prebuilt snippets for popular programming languages

" Themes
Plug 'mhartington/oceanic-next' " Oceanic theme
Plug 'morhetz/gruvbox' " Gruvbox theme
Plug 'fcpg/vim-orbital' " orbital theme
Plug 'christophermca/meta5'
Plug 'dracula/vim'
Plug 'calincru/peaksea.vim'

" Language Packs
Plug 'neoclide/coc.nvim', {'branch' : 'release', 'tag':'*','do':{->coc#util#install()}} "  Intellisense engine for neovim. Requires an LSP.
Plug 'elzr/vim-json' " Json better highlighting
Plug 'mattn/emmet-vim' " HTML Expansion using visual highlighting and vim commands.
" Plug 'sheerun/vim-polyglot' " Polygot language pack. Loads things on demand
Plug 'donRaphaco/neotex', { 'for' : 'tex' }  " Live preview for Latex
Plug 'tpope/vim-dispatch' " Compiler

" Utility
Plug 'tpope/vim-repeat' " Allows for repeating a command some number of times in functions.
Plug 'vimwiki/vimwiki' " Personal wiki inside of vim. Currently being used for notes and todo mostly.
call plug#end()

let g:coc_global_extensions = ['coc-emoji', 'coc-prettier', 'coc-json', 'coc-python']

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
set cmdheight=2 " Change this if we need a bigger command buffer height
set signcolumn=yes " Always display signcolumns(mostly for git)
set nocompatible
set number
filetype plugin on
set updatetime=100 "Relevant to the leader key menu popping up quickly.
set splitright " This and splitbelow define split behavior. 
set splitbelow
set statusline^=%{coc#status()}

" ----- Performance tuning ----- "
" TODO - au grouping for our stuff. Maybe if we do that or clear a bunch of them from plugins we can improve performance
" Don't redraw during macro executions
set lazyredraw
set noswapfile
set nowb
set nobackup
" Disable syntax highlighting for files >1M
augroup vimrc
  au Filetype * if getfsize(@%) > 1000000 | setlocal syntax=off | endif
  au BufWinEnter,Syntax * syn sync minlines=256 maxlines=256
augroup END

" ----- Tab settings ----- "
set tabstop=2
set shiftwidth=2
set expandtab


let g:python_recommended_style = 0
" ----------------- MACOS specific config -------------- "
if has("gui_macvim")
    au GUIEnter * set vb t_vb=
endif
if has("macunix")
    set rtp+=$(brew --prefix)/opt/fzf
    let g:python2_host_prog = '/usr/local/bin/python'
    let g:python3_host_prog = '/usr/local/bin/python3'
endif

" --------------- Theme config ------------------------- "
" Default Theme
colorscheme meta5
hi Normal guibg=None ctermbg=None
hi NonText guibg=None ctermbg=None
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
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1
"let g:startify_custom_header = [ 
"      \ '   _____                  __                        ',
"      \ '  / ___/____ _____  _____/ /___  ______ ________  __',
"      \ '  \__ \/ __ `/ __ \/ ___/ __/ / / / __ `/ ___/ / / /',
"      \ ' ___/ / /_/ / / / / /__/ /_/ /_/ / /_/ / /  / /_/ / ',
"      \ '/____/\__,_/_/ /_/\___/\__/\__,_/\__,_/_/   \__, /  ',
"      \ '                                           /____/   ']
let g:startify_custom_header = [
      \ '    ____        __  __                   _          _    ___         ',
      \ '   / __ \____ _/ /_/ /_  ____ ___  ____ ( )_____   | |  / (_)___ ___ ',
      \ '  / /_/ / __ `/ __/ __ \/ __ `__ \/ __ `/// ___/   | | / / / __ `__ \',
      \ ' / _, _/ /_/ / /_/ / / / / / / / / /_/ / (__  )    | |/ / / / / / / /',
      \ '/_/ |_|\__,_/\__/_/ /_/_/ /_/ /_/\__,_/ /____/     |___/_/_/ /_/ /_/ ',
      \ '                                                                     ',
      \ '   ______            _____      ',
      \ '  / ____/___  ____  / __(_)___ _',
      \ ' / /   / __ \/ __ \/ /_/ / __ `/',
      \ '/ /___/ /_/ / / / / __/ / /_/ / ',
      \ '\____/\____/_/ /_/_/ /_/\__, /  ',
      \ '                       /____/   ']
"function! AirlineInit()
  "let g:airline_section_a = airline#section#create(['mode',' ','branch'])
"endfunction
"autocmd VimEnter * call AirlineInit()
" Git gutter settings
let g:gitgutter_max_signs = 500 " Default value. 

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<A-Space>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

let g:vimwiki_list = [{'path':'~/.vimwiki/',
      \ 'nested_syntaxes': { 'python':'python', 'c++':'cpp', 'c':'c', 'bash':'sh', 'html':'html','css':'css','java':'java'},
      \ }]
      "\ 'syntax': 'markdown','ext' : '.md'}]

" -------------- Vim functions ------------------------ "
" Version of notes with preview window
command! -bang Notes call fzf#vim#files('~/.vimwiki/',{'options':['--preview','~/.local/share/nvim/plugged/fzf.vim/bin/preview.sh {}']},<bang>0)
"command! -bang Notes call fzf#vim#files('~/.vimwiki/',<bang>0)

" Uses Rg on the vimwiki directory
function! RipgrepNotes(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s ~/.vimwiki/|| true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang NoteSearch call RipgrepNotes(<q-args>, <bang>0)

command! -bang Todo call fzf#vim#grep(
      \ 'rg --column --line-number --no-heading --color=always --ignore-case todo ~/.vimwiki/ || true'.shellescape(<q-args>),1,
      \ fzf#vim#with_preview(), <bang>0)
"au! FileType which_key
"au  FileType which_key set laststatus=0 noshowmode noruler
"  \| au BufLeave <buffer> set laststatus=2 showmode ruler
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
let g:which_key_map.e.t = { 'name' : '+toggles'}
let g:which_key_map.f = { 'name' : '+file'}
let g:which_key_map.g = { 'name' : '+git'}
let g:which_key_map.l = { 'name' : '+lsp' }
let g:which_key_map.l.t = { 'name' : '+toggles'}
let g:which_key_map.n = { 'name' : '+notes'}
let g:which_key_map.s = { 'name' : '+session'}
let g:which_key_map.t = { 'name' : '+tab'}
let g:which_key_map.w = { 'name' : '+window'}

" ------ Keybindings and Dictionary stuff ------ "

" Buffer control
nnoremap <leader>bn :bn<CR>
let g:which_key_map.b.n = 'Next buffer'
nnoremap <leader>bp :bp<CR>
let g:which_key_map.b.p = 'Previous buffer'
nnoremap <leader>bd :bd<CR>
let g:which_key_map.b.d = 'Delete buffer'
nnoremap <leader>bo :Buffers<CR>
let g:which_key_map.b.o = 'Open buffers'
nnoremap <leader>bf :Lines<CR>
let g:which_key_map.b.f = 'Find in buffers'
nnoremap <leader>bt :Filetypes<CR>
let g:which_key_map.b.t= 'Change buffer filetype'

" ----  Wiki control
nnoremap <leader>nw :VimwikiIndex<CR> 
nnoremap <leader>nt :VimwikiTabIndex<CR>
nnoremap <leader>ns :NoteSearch<CR>
nnoremap <leader>nf :Notes<CR>
nnoremap <leader>nn :Todo<CR>
let g:which_key_map.n.w = 'Open notes index'
let g:which_key_map.n.t = 'Open notes index in tab'
let g:which_key_map.n.s = 'Search notes'
let g:which_key_map.n.f = 'Find note'
let g:which_key_map.n.n = 'Open todo'

"" Session control
nnoremap <leader>sl :SLoad<CR> 
let g:which_key_map.s.l = 'Load Session'
nnoremap <leader>ss :SSave!<CR> 
let g:which_key_map.s.s = 'Save Session'
nnoremap <leader>sd :SDelete!<CR> 
let g:which_key_map.s.d = 'Delete Session'
nnoremap <leader>sc :SClose<CR> 
let g:which_key_map.s.c = 'Close Session'


"" Tab control 
nnoremap <leader>tc :tabnew<CR> 
let g:which_key_map.t.c = 'Create tab'
nnoremap <leader>td :tabclose<CR>
let g:which_key_map.t.d = 'Delete tab'
nnoremap <leader>tn :tabnext<CR>
let g:which_key_map.t.n = 'Next tab'
nnoremap <leader>tp :tabprevious<CR>
let g:which_key_map.t.p = 'Previous tab'
nnoremap <leader>t1 1gt
nnoremap <leader>t2 2gt
nnoremap <leader>t3 3gt
nnoremap <leader>t4 4gt
let g:which_key_map.t.1 = 'First tab'
let g:which_key_map.t.2 = 'Second tab'
let g:which_key_map.t.3 = 'Third tab'
let g:which_key_map.t.4 = 'Fourth tab'

" File control
nnoremap <leader>ft :NERDTreeToggle<CR>
let g:which_key_map.f.t = 'Toggle file tree'
nnoremap <leader>ff :Files 
nnoremap <leader>fs :Rg<CR>
let g:which_key_map.f.s = 'Search files'
let g:which_key_map.f.f = 'Find file'
nnoremap <leader>fS :w suda://%<CR> " Saves current file as sudo
nnoremap <leader>fe :e suda://%<CR> " Opens current file for sudo writing
let g:which_key_map.f.S = 'Sudo save'
let g:which_key_map.f.e = 'Sudo reopen'


" Git Control with Fugitive
nnoremap <leader>gv :Commits<CR>
let g:which_key_map.g.v = "View commits"
nnoremap <leader>gV :BCommits<CR>
let g:which_key_map.g.V = "View buffer commits"
nnoremap <leader>gl :GV<CR>
let g:which_key_map.g.l = "View commits in GV"
nnoremap <leader>gL :GV!<CR>
let g:which_key_map.g.L = "View buffer commits in GV"
nnoremap <leader>gb :Gblame<CR>
let g:which_key_map.g.b = "View blame of buffer"
nnoremap <leader>gr :Grebase<CR>
let g:which_key_map.g.r = "Rebase"
nnoremap <leader>gf :Gfetch<CR>
let g:which_key_map.g.f = "Fetch"
nnoremap <leader>gp :Gpush<CR>
let g:which_key_map.g.p = "Push"
nnoremap <leader>gP :Gpull<CR>
let g:which_key_map.g.P = "Pull"
nnoremap <leader>gc :Gcommit<CR>
let g:which_key_map.g.c = "Commit"
nnoremap <leader>gm :Gmerge<CR>
let g:which_key_map.g.m = "Merge"
nnoremap <leader>gw :Gwrite<CR>
let g:which_key_map.g.w = "Write/add"


" -- Editor settings
" Open the config
nnoremap <leader>ec :e $MYVIMRC<CR>
let g:which_key_map.e.c = "Open config"
" Open color selector
nnoremap <leader>eC :Colors<CR>
let g:which_key_map.e.C = "Select colorscheme"
" Open mappings
nnoremap <leader>em :Maps<CR>
let g:which_key_map.e.m = "Open mappings"
nnoremap <leader>ee :Commands<CR>
let g:which_key_map.e.e = "Open commands"
nnoremap <leader>eh :Helptags<CR>
let g:which_key_map.e.h = "Open helptags"
nnoremap <leader>es :UltiSnipsEdit<CR>
let g:which_key_map.e.s = "Open snippets for filetype"

" Editor Toggles
nnoremap <leader>ett :TagbarToggle<CR>
let g:which_key_map.e.t.t = "Toggle tags"
nnoremap <leader>etn :set number!<CR>
let g:which_key_map.e.t.n = "Toggle numbers"
nnoremap <leader>etN :set relativenumber!<CR>
let g:which_key_map.e.t.N = "Toggle relative numbers"
nnoremap <silent><leader>ets 
      \ :if exists('syntax_on') <BAR>
      \ syntax off <BAR>
      \ else <BAR>
      \ syntax enable <BAR>
      \ endif<CR>
let g:which_key_map.e.t.s = "Toggle syntax highlighting"
nnoremap <leader>etm :set mouse=a<CR>
let g:which_key_map.e.t.m = "Turn mouse on"


" LSP Settings 
nnoremap <leader>le :CocConfig<CR>
let g:which_key_map.l.e = "Edit LSP config"
nnoremap <leader>lC :CocCommand<CR>
let g:which_key_map.l.C = "Commands"



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


" ------ All au keymappings, for both context based keys or conflicting keymaps ------ "
augroup PythonLeave
  au!
  au BufLeave *py unlet g:which_key_map.l.r
  au BufLeave *py unlet g:which_key_map.l.s
  au BufLeave *py unlet g:which_key_map.l.l
  au BufLeave *py unlet g:which_key_map.l.v
  au BufLeave *py unlet g:which_key_map.l.V
  au BufLeave *py unlet g:which_key_map.l.t.l
augroup END
augroup PythonEnter
  au!
  au BufEnter *py let g:which_key_map.l.r = "Run in terminal"
  au BufEnter *py let g:which_key_map.l.s = "Sort imports"
  au BufEnter *py let g:which_key_map.l.t.l = "Toggle linting"
  au BufEnter *py let g:which_key_map.l.l = "Run linting"
  au BufEnter *py let g:which_key_map.l.v = "View errors"
  au BufEnter *py let g:which_key_map.l.V = "View linter report"
augroup END
augroup VimwikiLeave
  au!
  au BufLeave ~/.vimwiki/* unlet g:which_key_map.n.d
  au BufLeave ~/.vimwiki/* unlet g:which_key_map.n.r
  au BufLeave ~/.vimwiki/* unlet g:which_key_map.n.h
  au BufLeave ~/.vimwiki/* unlet g:which_key_map.n.H
augroup END
augroup VimwikiEnter
  au!
  au BufEnter ~/.vimwiki/* let g:which_key_map.n.d = 'Delete note'
  au BufEnter ~/.vimwiki/* let g:which_key_map.n.r = 'Rename note'
  au BufEnter ~/.vimwiki/* let g:which_key_map.n.h = 'Generate HTML'
  au BufEnter ~/.vimwiki/* let g:which_key_map.n.H = 'Generate All HTML'
augroup END
augroup KeyMapping
  au!
  " ----- Python ----- "
  au Filetype python nnoremap <silent><buffer><leader>lr :CocCommand python.execInTerminal<CR>
  au Filetype python nnoremap <silent><buffer><leader>ls :CocCommand python.sortImports<CR>
  au Filetype python nnoremap <silent><buffer><leader>ll :CocCommand python.runLinting<CR>
  au Filetype python nnoremap <silent><buffer><leader>lV :CocCommand python.viewOutput<CR>
  au Filetype python nnoremap <silent><buffer><leader>lv :CocList diagnostics<CR>
  au Filetype python nnoremap <silent><buffer><leader>ltl :CocCommand python.enableLinting<CR>
  " ----- GitGutter ----- "
  "au VimEnter * nunmap <leader>hp
  "au VimEnter * nunmap <leader>hs
  "au VimEnter * nunmap <leader>hu
  " ----- Vimwiki ----- "
  " Clear vimwiki bindings "
  au VimEnter * nunmap <leader>ws
  au VimEnter * nunmap <leader>wi
  au VimEnter * nunmap <leader>ww
  au VimEnter * nunmap <leader>wt
  au Filetype vimwiki mapclear <buffer>

  " Rebind vimwiki's buffer bindings
  au Filetype vimwiki nnoremap <silent><buffer><TAB> :VimwikiNextLink<CR>
  au Filetype vimwiki nnoremap <silent><buffer><S-TAB> :VimwikiPrevLink<CR>
  au Filetype vimwiki nmap <silent><buffer> <CR> <Plug>VimwikiFollowLink
  au Filetype vimwiki nnoremap <silent><script><buffer> <Plug>VimwikiFollowLink :VimwikiFollowLink<CR>
  au Filetype vimwiki nnoremap <silent><buffer><BS> :VimwikiGoBackLink<CR>
  au Filetype vimwiki nnoremap <buffer><leader>nd :VimwikiDeleteLink<CR>
  au Filetype vimwiki nnoremap <buffer><leader>nr :VimwikiRenameLink<CR>
  au Filetype vimwiki nnoremap <buffer><leader>nh :Vimwiki2HTML<CR>
  au Filetype vimwiki nnoremap <buffer><leader>nH :VimwikiAll2HTML<CR>

  " Window control "
  au VimEnter * nnoremap <leader>wl <C-w><C-l>
  au VimEnter * let g:which_key_map.w.l = 'Right window'
  au VimEnter * nnoremap <leader>wh <C-w><C-h>
  au VimEnter * let g:which_key_map.w.h = 'Left window'
  au VimEnter * nnoremap <leader>wj <C-w><C-j>
  au VimEnter * let g:which_key_map.w.j = 'Down window'
  au VimEnter * nnoremap <leader>wk <C-w><C-k>
  au VimEnter * let g:which_key_map.w.k = 'Up window'
  au VimEnter * nnoremap <leader>ws <C-w><C-s>
  au VimEnter * let g:which_key_map.w.s = 'Split horizontally'
  au VimEnter * nnoremap <leader>wv <C-w><C-v>
  au VimEnter * let g:which_key_map.w.v = 'Split vertically'
  au VimEnter * nnoremap <leader>wd <C-w><C-q>
  au VimEnter * let g:which_key_map.w.d = 'Delete window'
  au VimEnter * nnoremap <leader>wr <C-w>R
  au VimEnter * let g:which_key_map.w.r = 'Reverse windows'
  au VimEnter * nnoremap <leader>wo :Windows<CR>
  au VimEnter * let g:which_key_map.w.o = 'Open windows'
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Tab for coc completion with characters ahead. 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"


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
"nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)
