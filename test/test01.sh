#!/bin/sh
# Make changes to multiple files and commit them
echo world >>a
echo world >>b
echo hello world >c
./pigs-add a
echo world >>b
rm d
./pigs-rm e
./pigs-add g
./pigs-commit -a -m 'third commit'
./pigs-status
