# vimrc
my own vimrc file. always adjusted.

# key maps
* search current file'tag: `<leader>t`  (implemented using ctrlPLine)

# golang `CtrlPBufTag` command support
Add the following to ~/.ctags:
```shell
--langdef=Go
--langmap=Go:.go
--regex-Go=/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/
--regex-Go=/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,var/
--regex-Go=/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,type/
```
https://github.com/jordwalke/VimBox/blob/master/dotVim/pluginRc/ctrlPVimRc  
http://go-wise.blogspot.jp/2011/09/using-ctags-with-go.html  
