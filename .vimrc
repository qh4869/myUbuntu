set nocompatible              " be iMproved, required
set backspace=2		      " 简易版本vim要有这句话，不然不能backspace
filetype off                  " required

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
Plugin 'Valloric/YouCompleteMe' " 大约需要一个小时;或者自己从github上下载，install时候还会提示一个命令下载submodule
"Bundle "scrooloose/syntastic"
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'

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

"缩进
"set autoindent
"set softtabstop=4
"set tabstop=4
"set shiftwidth=4
"set smartindent
set pastetoggle=<F9> " 多行粘贴使用的模式，不然缩进会出现问题
set nu

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
"新版YCM总是提示找不到配置文件，默认的文件位置和老板不一样
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

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
"let g:nerdtree_tabs_open_on_console_startup=1    
autocmd vimenter * NERDTree
"wincmd w
autocmd VimEnter * wincmd w

"===================需要下载文件===============
"python 自动补齐pydiction of github
"路径根据github上的说明去放置
filetype plugin on
let g:pydiction_location = '~/.vim/bundle/pydiction/complete-dict'
let g:pydiction_menu_height = 3 "size

