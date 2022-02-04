set tabstop=4
set shiftwidth=4
set smartindent              " 为c程序提供自动缩进
set wrapmargin=2             " 边缘2字符
set mouse+=a
inoremap bb {<Enter>}<Esc><S-o>   " 括号


set showmode
set showcmd




set go=
set nu
set relativenumber
set cursorline
set cursorcolumn
highlight CursorColumn ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold      " cursorColumn color
set wildmenu                 " tab

exec "nohlsearch"
set incsearch
set smartcase
set  t_Co=256
set magic
set scrolloff=7
set viminfo='1000,<500       " 突破粘贴50行，上限500行   


set nolist                   " 隐藏不可见字符
set nocompatible             " vim and vi	
filetype on
filetype plugin on
filetype plugin indent on
set encoding=utf-8
let &t_ut=''
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
se t_ti= t_te=            " 退出 显示在命令行




map s <nop>
map S :w<CR>
map Q :q<CR>


map R :source $MYVIMRC<CR>
map ; :

" 快速添加空行
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>


call plug#begin('~/.vim/plugged')



Plug 'vim-airline/vim-airline'                         " show title
Plug 'flazz/vim-colorschemes'                          " theme collection   
Plug 'connorholyday/vim-snazzy'                        " a theme
Plug 'skywind3000/vim-auto-popmenu'                    " 
Plug 'preservim/tagbar'
Plug 'skywind3000/vim-dict'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'neoclide/coc.nvim', {'branch': 'release'}        " not config

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'


call plug#end()



let g:SnazzyTransparent = 1                 " 和终端有关 

" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'*':1}               

" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b

" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c

" ====
" ====ale
" ====
let g:ale_linters_explicit = 1
let g:ale_linters = {
  \   'bash':['shell'],
  \   'csh': ['shell'],
  \   'zsh': ['shell'],
  \   'go': ['gofmt', 'golint'],
  \   'python': ['flake8', 'mypy', 'pylint'],
  \   'c': ['gcc', 'cppcheck'],
  \   'cpp': ['gcc', 'cppcheck'],
  \   'text': [],
  \}
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++11'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''



" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
       \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" ===
" === vim-indent-guide
" ===
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig
