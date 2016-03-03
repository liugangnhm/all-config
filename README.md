This repository contains all my configs of my Commonly used software
eg. VIM, tmux.

# golang `CtrlPBufTag` command support
Add the following to ~/.ctags to make ctags support golang
```shell
--langdef=Go
--langmap=Go:.go
--regex-Go=/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/
--regex-Go=/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,var/
--regex-Go=/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,type/
```

**Reference**

[https://github.com/jordwalke/VimBox/blob/master/dotVim/pluginRc/ctrlPVimRc](https://github.com/jordwalke/VimBox/blob/master/dotVim/pluginRc/ctrlPVimRc) 
[http://go-wise.blogspot.jp/2011/09/using-ctags-with-go.html](http://go-wise.blogspot.jp/2011/09/using-ctags-with-go.html) 
