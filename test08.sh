#!/bin/dash

# Initialize the repository
OUTPUT=$(./pigs-init)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', got '$OUTPUT'"
    exit 1
fi

# Create a file 'a' and add it to the repository
echo hello > a
./pigs-add a

# Commit the file
OUTPUT=$(./pigs-commit -m 'initial commit')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', got '$OUTPUT'"
    exit 1
fi

# Change the content of the file 'a'
echo modified > a

# Commit the file with automatic stage
OUTPUT=$(./pigs-commit -a -m 'modified a')
EXPECTED="Committed as commit 1"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', got '$OUTPUT'"
    exit 1
fi

# Check the status of the repository
OUTPUT=$(./pigs-status)
EXPECTED="a - same as repo"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', got '$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
