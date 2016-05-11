This repository contains all my configs of my Commonly used software
eg. VIM, tmux.

[toc]

# vim configuration

## golang support

### Using ctags with Go

Add the following to ~/.ctags to make ctags support golang

```shell
--langdef=Go
--langmap=Go:.go
--regex-Go=/func([ \t]+\([^)]+\))?[ \t]+([a-zA-Z0-9_]+)/\2/d,func/
--regex-Go=/var[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,var/
--regex-Go=/type[ \t]+([a-zA-Z_][a-zA-Z0-9_]+)/\1/d,type/
```

### search function definition

for searching interface implementation, we always need to search function
name(`guru` do the same but some times it does not work.)

- `<leader>gf` do an search under the cursor.

# tmux configuration

* map prefix to C-A
* turn off auto rename
* vim color scheme compatible changes

you should add below code to your shell profile:

```shell
alias tmux="tmux -2"
```

And set up the default-terminal option in ~/.tmux.conf:  

```bash
set -g default-terminal "xterm"
```

**Reference**  

- [CtrlpRC](https://github.com/jordwalke/VimBox/blob/master/dotVim/pluginRc/ctrlPVimRc)  
- [Using ctags with Go](http://go-wise.blogspot.jp/2011/09/using-ctags-with-go.html)
