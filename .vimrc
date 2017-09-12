"语法高亮
syntax enable
syntax on

"缩进
set autoindent
set softtabstop=4
set tabstop=4
set shiftwidth=4
set smartindent
set nu

"颜色
set background=dark

"显示匹配,前后括号
set showmatch

"光标位置
set ruler

"允许折叠
set foldenable

"文件类型检测
filetype on
"载入文件类型插件（包括了更多的类型）
filetype plugin on
"为特定文件类型载入相关的缩进文件
filetype indent on

"快速执行
map <F5> :call RunFun()<CR>
func! RunFun()
	exec "w"
	if &filetype == 'python'
		exec "!python3 %"
	endif
endfunc

"启动鼠标，按住shift为没启动该功能(用于复制粘贴)
set mouse=a
