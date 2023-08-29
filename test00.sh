#!/bin/dash

# Initialize the repository and add multiple files
OUTPUT=$(./pigs-init)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

touch a b c d e f g h
./pigs-add a b c d e f

OUTPUT=$(./pigs-commit -m 'first commit')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo hello >a
echo hello >b

OUTPUT=$(./pigs-commit -a -m 'second commit')
EXPECTED="Committed as commit 1"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
