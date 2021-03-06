set nocompatible              " be iMproved, required
set backspace=2		      " 简易版本vim要有这句话，不然不能backspace
filetype off                  " required

" 文件编码
let &termencoding=&encoding
set fileencodings=utf-8,gbk,ucs-born,cp936

" 启用vundle来管理vim插件,ref:http://www.jianshu.com/p/8d416ac4ad11
" 使用Vundle来管理插件
" vim plugin bundle control, command model
"     :BundleInstall     install 安装配置的插件
"     :BundleInstall!    update  更新
"     :BundleClean       remove plugin not in list 删除本地无用插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" ---------------安装插件写在这之后----------------------------------------
" plugin需要在进入vim后执行PluginInstall,bundle需要执行BundleInstall
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe' " 自动补全，自己从github上下载比较好，install时候还会提示一个命令下载submodule
"Bundle "scrooloose/syntastic"
Plugin 'scrooloose/nerdtree'
"Plugin 'w0rp/ale' " 语法检查

" ---------------安装插件写在这之前----------------------------------------
call vundle#end()            " required
filetype plugin on    " required

" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是你自己的配置

"语法高亮
syntax enable
syntax on
"高亮搜索
set hlsearch

"状态栏,显示当前的模式
set laststatus=2

"缩进
"set autoindent
"set softtabstop=4
"set tabstop=4
set shiftwidth=4
"set smartindent
set pastetoggle=<F9> " 多行粘贴使用的模式，不然缩进会出现问题
set nu
" tab -> 4 space
set ts=4
set expandtab

"颜色
set background=dark

"显示匹配,前后括号
set showmatch

"光标位置
set ruler

"不折行显示，看情况可选
set nowrap

"水平滚动条for gvim
set guioptions+=b

"允许折叠
set foldenable

"为特定文件类型载入相关的缩进文件
filetype indent on
"文件类型检测
filetype on
"载入文件类型插件（包括了更多的类型）
filetype plugin on

"快速执行
map <F5> :call RunFun()<CR>
func! RunFun()
	exec "w"
	if &filetype == 'python'
		exec "!python3 %"
	endif
endfunc

"启动鼠标，按住shift为没启动该功能(用于复制粘贴),先按再选
set mouse=a

"----------------YCM配置-------------------------
"新版YCM总是提示找不到配置文件，默认的文件位置和老版不一样
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' "原路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' " 复制路径,不要写~路径，好像不识别
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_autoclose_preview_window_after_completion = 1 "补全后关闭preview
let g:ycm_complete_in_strings = 1 "字符串中也补全
let g:ycm_complete_in_comments = 1 "注释中也补全
let g:ycm_seed_identifiers_with_syntax = 1 "语法关键词补全

"----------------NERDTREE配置--------------------
""将F2设置为开关NERDTree的快捷键
map <f2> :NERDTreeToggle<cr>
""修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
""窗口位置
let g:NERDTreeWinPos='left'
""窗口尺寸
let g:NERDTreeSize=30
""窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
""不显示隐藏文件
let g:NERDTreeHidden=0
""打开vim时如果没有文件自动打开NERDTree
autocmd vimenter * if !argc()|NERDTree|endif
""当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 "设置打开vim的时候默认打开目录树
let g:nerdtree_tabs_open_on_console_startup=0    
"autocmd vimenter * NERDTree
"wincmd w
"autocmd VimEnter * wincmd w

""=============ale配置================================
""ale
"" Enable completion where available.
""let g:ale_completion_enabled = 1
""始终开启标志列
"let g:ale_sign_column_always = 1
"let g:ale_set_highlights = 0 
""自定义error和warning图标
"let g:ale_sign_error = '>>'
"let g:ale_sign_warning = '--'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
""nmap sp <Plug>(ale_previous_wrap)
""nmap sn <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
""nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
""nmap <Leader>d :ALEDetail<CR>

"=============ctags配置=============================
"用户追溯函数定义ctrl + ]
"需要先在linux上安装ctags,然后在工程目录ctags-R,
"生成tags文件，可能还需要加入exclude或者ignore
"vim自带跳转到上次推出vim时的光标位置ctrl+o 恢复ctrl+i
set tags+=~/sdk-gcc/tags
