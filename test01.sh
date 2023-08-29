#!/bin/dash

# Make changes to multiple files and commit them
OUTPUT=$(./pigs-init 2>&1)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo world >>a
echo world >>b
echo hello world >c
./pigs-add a
echo world >>b

if rm d 2>/dev/null; then
    echo "Test fail: Expected error when removing 'd', but got no error"
    exit 1
fi

OUTPUT=$(./pigs-rm e 2>&1) 
EXPECTED="pigs-rm: error: 'e' is not in the pigs repository"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

OUTPUT=$(./pigs-add g 2>&1)
EXPECTED="pigs-add: error: can not open 'g'"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

OUTPUT=$(./pigs-commit -a -m 'third commit')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

OUTPUT=$(./pigs-status 2>&1)
EXPECTED="a - same as repo\nb - untracked\nc - untracked"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '\n$EXPECTED', but got '\n$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
