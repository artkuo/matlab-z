# Matlab-z  Smart directory switcher using fuzzy matching
`z DIRSUBSTR`  Change current working directory to best match

Uses a fuzzy match between input `DIRSUBSTR` (directory substring) and
the recent history of working directories. Just type a partial match to
a desired recent directory, and `z` will automatically jump to it.

For example, for recent directories "path/to/dir1" and "path/dir2", the
command `z 1` will match to "dir1" and change to that directory.

Inspired by z directory jumping in zsh, and zoxide command line tool.

Heavy lifting is done by fzsearch, Matlab file exchange 66271-fuzzy-search.
fzsearch and its license are distributed here.
