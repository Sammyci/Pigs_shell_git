#!/bin/sh
# Test handling of same file after renaming, expect 'b' to be untracked after commit.
./pigs-init
echo hello > a
./pigs-add a
mv a b
./pigs-commit -m 'commit a after rename'
./pigs-status
