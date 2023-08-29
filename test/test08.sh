#!/bin/sh
# Test handling of changes to files that were committed and then modified without being added again.
./pigs-init
echo hello > a
./pigs-add a
./pigs-commit -m 'first commit'
echo change > a
./pigs-commit -a -m 'second commit'
./pigs-status
