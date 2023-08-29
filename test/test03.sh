#!/bin/sh
# Test handling of files with same contents but different names, expect 'b' to be untracked after commit.
./pigs-init
echo hello > a
cp a b
./pigs-add a
./pigs-commit -m 'commit a'
./pigs-status
