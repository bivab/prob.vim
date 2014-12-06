# prob.vim

VIM plugin to show a quickfix list of parse and type errors for classical B
machines (```.mch```) using the command line tool of the
[ProB](http://stups.hhu.de/ProB) animator and model checker for the B-Method.

## Configuration

The plugin expects the probcli binary in the current PATH. The path to the
binary can be configured by overriding the ```g:prob_parser``` variable in your
VIM configuration.

```
let g:prob_parser = ~/some_path/probcli
```
