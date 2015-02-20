# prob.vim

VIM plugin to show a quickfix list of parse and type errors for classical B
machines (`.mch`) using the command line tool of the
[ProB](http://stups.hhu.de/ProB) animator and model checker for the B-Method.

## Installation

To install, depending on how you manage your VIM plugins place the
corresponding snippet in .vimrc or execute the corresponding commands:

### Vundle

```vim
Plugin 'bivab/prob.vim'
```

### NeoBundle

```vim
NeoBundle 'bivab/prob.vim'
```

### pathogen.vim

```sh
cd ~/.vim/bundle
git clone https://github.com/bivab/prob.vim
```

## Configuration

The plugin expects the `probcli` binary in the current `$PATH`. The path to the
binary can be configured by overriding the `g:prob_parser` variable in your
VIM configuration.

```sh
let g:prob_parser = "~/some_path/probcli"
```
