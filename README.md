# some configuration files in my Ubuntu
* .gdbinit  gdb配置，用户主目录
* .tmux.conf    tmux配置，用户主目录
* .vimrc    vim配置，用户主目录
* .ycm_extra_conf.py ycm配置，位置参考.vimrc，当前位于用于主目录
* CMakeLists    CMakeLIsts Demo
* config.json   shawdowsocks server配置文件，运行时指定路径，常位于/etc
* my_desktop_startup    桌面启动脚本，需要用户界面单独设置，注意没有root权限，适合界面打开的程序启动
* rc.local  启动项，有root权限，登录前启动，注意依赖文件必须在root路径中，不然可能有一些库文件找不到
* shadowsocks-libev 国外服务器用于ipv4转ipv6的配置
