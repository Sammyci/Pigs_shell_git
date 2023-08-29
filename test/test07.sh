#!/bin/sh
# Test multiple commits, files 'c' and 'd' should be untracked after commits.
./pigs-init
echo hello > a
echo world > b
./pigs-add a b
./pigs-commit -m 'first commit'
echo change > a
echo change > b
./pigs-add a b
./pigs-commit -m 'second commit'
echo new > c
echo new > d
./pigs-add c d
./pigs-commit -m 'third commit'
./pigs-status
