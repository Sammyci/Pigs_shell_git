#!/bin/sh
# Test handling of changes to files that were added, then changed and added again before committing.
./pigs-init
echo hello > a
./pigs-add a
echo change > a
./pigs-add a
./pigs-commit -m 'committed changed a'
./pigs-status
