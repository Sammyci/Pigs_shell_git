#!/bin/dash

# Initialize the repository
OUTPUT=$(./pigs-init)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Create a file and add it to the repository
echo hello > a
cp a b
./pigs-add a

# Commit the changes
OUTPUT=$(./pigs-commit -m 'commit a')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Check the status of the files in the repository
OUTPUT=$(./pigs-status)
EXPECTED="a - same as repo\nb - untracked"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '\n$EXPECTED', but got '\n$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
