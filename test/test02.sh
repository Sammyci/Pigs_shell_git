#!/bin/sh
# Test creating, modifying, and committing new files
touch i j k
echo hello >i
echo world >j
./pigs-add i j
./pigs-commit -a -m 'fourth commit'
echo hello world >>k
./pigs-add k
./pigs-commit -a -m 'fifth commit'
./pigs-status
