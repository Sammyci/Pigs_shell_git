#!/bin/dash

# Test creating, modifying, and committing new files
OUTPUT=$(./pigs-init)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

touch i j k
echo hello >i
echo world >j
./pigs-add i j

OUTPUT=$(./pigs-commit -a -m 'fourth commit')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo hello world >>k
./pigs-add k

OUTPUT=$(./pigs-commit -a -m 'fifth commit')
EXPECTED="Committed as commit 1"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

OUTPUT=$(./pigs-status)
EXPECTED="i - same as repo\nj - same as repo\nk - same as repo"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '\n$EXPECTED', but got '\n$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
