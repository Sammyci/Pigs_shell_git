#!/bin/sh
# Test handling of deleted file, should commit deletion successfully.
./pigs-init
echo hello > a
./pigs-add a
./pigs-commit -m 'first commit'
rm a
./pigs-rm a
./pigs-commit -m 'deleted a'
./pigs-status
