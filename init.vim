" 常规配置
" 修改esc
imap jk <Esc>

" 修改<leader>
let mapleader =','

" 修改:
nmap <space> :

" 配置resize window
map + <C-w>+
map - <C-w>-
map < <C-w><
map > <C-w>>
map = <C-w>=

" 取消一致性
set nocompatible

" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileencoding=uft-8
set termencoding=utf-8
set encoding=utf-8

" 设置行号
set number

" 高亮光标所在的行列
set cursorline

"括号匹配
set showmatch

" 设置缩进
set autoindent
set tabstop=4

" 允许鼠标操作
set mouse=a

" 使用剪贴板
set clipboard=unnamed

" 设置搜索高亮
set hlsearch

set ignorecase
syntax on

" vim 插件配置
call plug#begin('~/.vim/plugged')
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jistr/vim-nerdtree-tabs'
" 设置快捷打开
nnoremap <silent> <TAB> :NERDTreeToggle<CR>
nnoremap <silent> <leader><TAB> :NERDTreeFind<CR>
nnoremap <C-l> :tabn <cr>      " 下一个tab
nnoremap <C-h> :tabp <cr>      " 上一个tab
nnoremap <C-n> :tabnew <cr>    " 新建tab
nnoremap <C-k> :tabclose <cr>  " 关闭tab
" 高亮
highlight NERDTreeFile ctermfg=14
" 将当前目录视为root
let NERDTreeChDirMode=1
" 设置视窗大小
let g:NERDTreeWinSize = 25
" 以minimalUI模式运行
let NERDTreeMinimalUI=1
" 自动显示bookmarks
let NERDTreeShowBookmarks=1
" 显示隐藏文件
let NERDTreeShowHidden=1
" 忽略指定文件
let NERDTreeIgnore = ['\.py[cd]$', '\.swp', '\.swo$', '\.vscode', '__pycache__', '\.git$']
" 文件高亮
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
au VimEnter * call NERDTreeHighlightFile('py', 'red', 'none', 'red', '#151515')
au VimEnter * call NERDTreeHighlightFile('go', 'white', 'none', 'white', '#151515')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('css', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('yaml', 'blue', 'none', '#3366FF', '#151515')
au VimEnter * call NERDTreeHighlightFile('json', 'blue', 'none', '#3366FF', '#151515')
au VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
highlight! link NERDTreeFlags NERDTreeDir

" nerdtree-git-plugin 配置
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" vim-nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_open_on_new_tab=0

Plug 'majutsushi/tagbar'
nnoremap <silent> <F2> :TagbarToggle <CR>
let g:tagbar_autofocus = 1

" 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = [
  \  'coc-highlight',
  \  'coc-yank',
  \  'coc-emmet',
  \  'coc-git',
  \  'coc-json',
  \  'coc-html',
  \  'coc-clangd',
  \  'coc-cmake',
  \  'coc-pyright',
  \  'coc-jedi',
  \  'coc-go',
  \  'coc-snippets',
  \  'coc-yaml',
  \  'coc-syntax',
  \  'coc-pairs',
  \  'coc-xml',
  \  'coc-sh',
  \ ]

" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
set cmdheight=2
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" EasyMotion
Plug 'easymotion/vim-easymotion'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

set laststatus=2  "永远显示状态栏
let g:airline#extensions#tabline#enabled = 1           " 自动显示全部buffers
let g:airline_powerline_fonts = 1                      " 支持powerline字体
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

call plug#end()
