#!/bin/sh
# Test handling of multiple file changes, only changes to 'b' and 'd' are committed.
./pigs-init
echo hello > a
echo world > b
./pigs-add a b
./pigs-commit -m 'first commit'
echo change > a
echo change > b
./pigs-add b
echo change > c
./pigs-add c d
./pigs-commit -m 'committed changes to b and d'
./pigs-status
