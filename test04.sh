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
./pigs-add a

# Rename the file and commit
mv a b
OUTPUT=$(./pigs-commit -m 'commit a after rename')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Check the status of the files in the repository
OUTPUT=$(./pigs-status)
EXPECTED="a - file deleted\nb - untracked"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '\n$EXPECTED', but got '\n$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
