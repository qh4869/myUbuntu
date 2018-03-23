set history save on
set history size 256
set history remove-duplicates 0
set history filename ~/.gdb_history

#gdb_tui 不能ctrl+r搜索历史输入
layout src
focus cmd
