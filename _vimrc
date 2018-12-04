" vimrc by EUYUIL <contact@euyuil.com>
" Based on http://mail.ustc.edu.cn/~stephen1/script/vimrc.html
" Last Update: 2011-04-11

" 键盘快捷键映射
let mapleader=";"
nmap <space> :
nmap <leader>ww :w!<cr>
nmap <leader>wq :wq<cr>
nmap <leader>sh :shell<cr>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bd :bp\|bd #<cr>
nmap <leader>nt :NERDTree<cr>
nmap <leader>f <C-W><C-W>
nmap <leader>j <C-W><C-W>
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>
imap <C-e> <END>
imap <C-a> <HOME>

" 自动完成括号和引号
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

" ICPC 模板
nmap <leader>cc :r~/.vim/templates/icpc.cc<cr>kdd

" 缩写
iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab imail EUYUIL <contact@euyuil.com>
iab iumail EUYUIL <6yue@tongji.edu.cn>
iab igmail EUYUIL <euyuil@gmail.com>
iab isite EUYUIL <http://euyuil.com/>
iab iname EUYUIL
iab #i #include
iab #d #define

" 预先准备操作系统标记
if (has("win32") || has("win64") || has("win32unix"))
    let g:iswin=1
else
    let g:iswin=0
endif

" 预先准备图形化界面标记
if has("gui_running")
    let g:isgui=1
else
    let g:isgui=0
endif

" 行为和外观设置
set nocompatible                    " 关闭对 Vi 的兼容支持
set nobackup                        " 因为现在版本控制大行其道，所以不用备份了
set ruler                           " 显示标尺
set ignorecase                      " 搜索时忽略大小写
set hlsearch                        " 高亮搜索关键词
set incsearch                       " 打开增量搜索，即关键词未输入完成就显示结果
syntax on                           " 打开语法高亮，不开会死人的
set backspace=indent,eol,start      " 设置 Backspace 的习惯
set whichwrap=b,s,<,>,[,]           " 设置方向键可以到上一行或下一行
set ambiwidth=double                " 让全角字符能够正确显示？
filetype plugin indent on           " 自动判断文件类型和缩进
set number                          " 显示行号
set lz                              " 当运行宏命令执行完成之前，不重绘屏幕
set hid                             " 可以在没有保存的情况下切换缓冲区
set showcmd                         " 显示命令
set vb t_vb=                        " 不使用 Beep 或 Flash
set history=1024                    " 历史记录条数，默认是 20
set autoread                        " 当文件在外部被修改时，自动重新读取
set mouse=a                         " 在所有模式下允许使用鼠标

" 文字编码设置
set encoding=utf-8
set fileencodings=ucs_bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" 缩进设置
set autoindent                      " 设置自动缩进
set smartindent                     " 设置智能缩进
set shiftwidth=4                    " 以 4 个空格为 1 个缩进
set tabstop=4                       " 一个 Tab 占 4 个空格
set expandtab                       " 默认将新输入的 Tab 替换为空格
set smarttab                        " 如果用空格缩进，一股脑删除 4 个空格

" 断行设置
" set tw=78                           " 光标超过 78 列时断行
set lbr                             " 尽量不在单词中断行
set fo+=mB                          " 中文字符可以切断，并且中文之间不用补空格

" C/C++ 的格式设置
set showmatch                       " 显示括号匹配情况
set cindent                         " 自动缩进，选中时按等号可以调整格式？
set cino=:0g0t0(sus

" 杂项设置
set keymodel=                       " 不使用 Shift 加方向键来选择文本
set selection=inclusive             " 光标所在位置也加入选区
set wildmenu                        " 命令自动补全时使用一个目录显示候选项

hi Normal ctermbg=none

" 平台相关的设置
if (g:isgui)
    if (g:iswin)
        " set guifont=Yahei_Consolas_Hybrid:h13
        " set guifont=Yahei_Mono:h9
        set guifont=Consolas:h11

        " 以下脚本能够有效地使 Windows 中 gVim 的菜单栏正确显示
        language message zh_CN.UTF-8
        source $VIMRUNTIME/delmenu.vim
        set langmenu=zh_CN.UTF-8

        " 若是图形界面则无需断行，还可以显示水平滚动条
        set nowrap
        set guioptions+=b
    else
        set guifont=DejaVu\ Sans\ Mono\ 10
    endif
else
    set wrap
endif

au FileReadPost,FileWritePre *.cpp,*.hpp,*.cc,*.c,*.h,*.cxx retab
au BufReadPre,FileReadPre,BufNewFile *.coffee,*.rb,*.erb,*.*htm*,*.*ml,*.js,*.jade,*.css,*.styl,*.json set tabstop=2 shiftwidth=2

" 设置折叠格式为按照缩进折叠 zM zR
set fdm=indent

" 默认不折叠
au BufRead,BufWinEnter * normal zR

execute pathogen#infect()

set listchars=eol:\ ,tab:>-,trail:~,extends:>,precedes:<
set list
nnoremap <F3> :set list!<CR>
