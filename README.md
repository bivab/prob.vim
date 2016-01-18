# prob.vim

![ProB Logo](https://www3.hhu.de/stups/prob/skins/prob/img/prob_logo.png)

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

### Manual Installation

If you do not wan't to use a plugin manager, place a of copy
the contents of this repository into the directores with the corresponding
names within your `~/.vim` directory.

### Requirements

This plugin depends on [ProB
CLI](http://www.stups.hhu.de/ProB/index.php5/ProB_Cli) which is shipped with
[ProB](http://stups.hhu.de/ProB), Additionally the ProB parser depends on Java
7 or later, see [Java requirements for B
parser](http://stups.hhu.de/ProB/index.php5/Download#Java__Requirements_for_B_parser)
for details.

## Configuration

The plugin expects the `probcli` binary in the current `$PATH`. The path to the
binary can be configured by overriding the `g:prob_parser` variable in your
VIM configuration.

```sh
let g:prob_parser = "~/some_path/probcli"
```
