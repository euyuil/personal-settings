" vimrc by EUYUIL <contact@euyuil.com>
" Based on http://mail.ustc.edu.cn/~stephen1/script/vimrc.html
" Last Update: 2011-04-11

" ���̿�ݼ�ӳ��
let mapleader=";"
nmap <space> :
nmap <leader>ww :w!<cr>
nmap <leader>wq :wq<cr>
nmap <leader>sh :shell<cr>
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nn <C-J> :bn<cr>
nn <C-K> :bp<cr>
imap <C-e> <END>
imap <C-a> <HOME>

" �Զ�������ź�����
inoremap <leader>1 ()<esc>:let leavechar=")"<cr>i
inoremap <leader>2 []<esc>:let leavechar="]"<cr>i
inoremap <leader>3 {}<esc>:let leavechar="}"<cr>i
inoremap <leader>4 {<esc>o}<esc>:let leavechar="}"<cr>O
inoremap <leader>q ''<esc>:let leavechar="'"<cr>i
inoremap <leader>w ""<esc>:let leavechar='"'<cr>i

" ICPC ģ��
nmap <leader>cc :r~/.vim-icpctmpl.cc<cr>kdd

" ��д
iab idate <c-r>=strftime("%Y-%m-%d")<CR>
iab itime <c-r>=strftime("%H:%M")<CR>
iab imail EUYUIL <contact@euyuil.com>
iab iumail EUYUIL <6yue@tongji.edu.cn>
iab igmail EUYUIL <euyuil@gmail.com>
iab isite EUYUIL <http://euyuil.com/>
iab iname EUYUIL
iab #i #include
iab #d #define

" Ԥ��׼������ϵͳ���
if (has("win32") || has("win64") || has("win32unix"))
    let g:iswin=1
else
    let g:iswin=0
endif

" Ԥ��׼��ͼ�λ�������
if has("gui_running")
    let g:isgui=1
else
    let g:isgui=0
endif

" ��Ϊ���������
set nocompatible                    " �رն� Vi �ļ���֧��
colorscheme slate                   " ������ɫ����Ϊ slate, ����ϲ����
set nobackup                        " ��Ϊ���ڰ汾���ƴ�����������Բ��ñ�����
set ruler                           " ��ʾ���
set ignorecase                      " ����ʱ���Դ�Сд
set hlsearch                        " ���������ؼ���
set incsearch                       " ���������������ؼ���δ������ɾ���ʾ���
syntax on                           " ���﷨���������������˵�
set backspace=indent,eol,start      " ���� Backspace ��ϰ��
set whichwrap=b,s,<,>,[,]           " ���÷�������Ե���һ�л���һ��
set ambiwidth=double                " ��ȫ���ַ��ܹ���ȷ��ʾ��
filetype plugin indent on           " �Զ��ж��ļ����ͺ�����
set number                          " ��ʾ�к�
set lz                              " �����к�����ִ�����֮ǰ�����ػ���Ļ
set hid                             " ������û�б����������л�������
set showcmd                         " ��ʾ����
set vb t_vb=                        " ��ʹ�� Beep �� Flash
set history=1024                    " ��ʷ��¼������Ĭ���� 20
set autoread                        " ���ļ����ⲿ���޸�ʱ���Զ����¶�ȡ
set mouse=a                         " ������ģʽ������ʹ�����

" ���ֱ�������
set encoding=utf-8
set fileencodings=ucs_bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" ��������
set autoindent                      " �����Զ�����
set smartindent                     " ������������
set shiftwidth=4                    " �� 4 ���ո�Ϊ 1 ������
set tabstop=4                       " һ�� Tab ռ 4 ���ո�
set expandtab                       " Ĭ�Ͻ�������� Tab �滻Ϊ�ո�
set smarttab                        " ����ÿո�������һ����ɾ�� 4 ���ո�

" ��������
" set tw=78                           " ��곬�� 78 ��ʱ����
set lbr                             " �������ڵ����ж���
set fo+=mB                          " �����ַ������жϣ���������֮�䲻�ò��ո�

" C/C++ �ĸ�ʽ����
set showmatch                       " ��ʾ����ƥ�����
set cindent                         " �Զ�������ѡ��ʱ���Ⱥſ��Ե�����ʽ��
set cino=:0g0t0(sus

" ��������
set keymodel=                       " ��ʹ�� Shift �ӷ������ѡ���ı�
set selection=inclusive             " �������λ��Ҳ����ѡ��
set wildmenu                        " �����Զ���ȫʱʹ��һ��Ŀ¼��ʾ��ѡ��

" ƽ̨��ص�����
if (g:isgui)
    if (g:iswin)
        " set guifont=Yahei_Consolas_Hybrid:h13
        set guifont=Yahei_Mono:h9

        " ���½ű��ܹ���Ч��ʹ Windows �� gVim �Ĳ˵�����ȷ��ʾ
        language message zh_CN.UTF-8
        source $VIMRUNTIME/delmenu.vim
        set langmenu=zh_CN.UTF-8

        " ����ͼ�ν�����������У���������ʾˮƽ������
        set nowrap
        set guioptions+=b
    else
        set guifont=DejaVu\ Sans\ Mono\ 9
    endif
else
    set wrap
endif

au FileReadPost,FileWritePre *.cpp,*.hpp,*.cc,*.c,*.h,*.cxx retab
au BufReadPre,FileReadPre,BufNewFile *.rb,*.erb,*.*htm*,*.*ml,*.js,*.jade,*.css,*.styl set tabstop=2 shiftwidth=2
