#!/bin/sh
# Initialize the repository and add multiple files
./pigs-init
touch a b c d e f g h
./pigs-add a b c d e f
./pigs-commit -m 'first commit'
echo hello >a
echo hello >b
./pigs-commit -a -m 'second commit'
