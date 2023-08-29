#!/bin/dash

# Initialize the repository
OUTPUT=$(./pigs-init)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Create files 'a' and 'b' and add them to the repository
echo hello > a
echo world > b
./pigs-add a b

# Commit the files
OUTPUT=$(./pigs-commit -m 'first commit')
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Modify files 'a' and 'b' and add them to the repository
echo change > a
echo change > b
./pigs-add a b

# Commit the changes
OUTPUT=$(./pigs-commit -m 'second commit')
EXPECTED="Committed as commit 1"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Create new files 'c' and 'd' and add them to the repository
echo new > c
echo new > d
./pigs-add c d

# Commit the changes
OUTPUT=$(./pigs-commit -m 'third commit')
EXPECTED="Committed as commit 2"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Check the status of the files in the repository
OUTPUT=$(./pigs-status)
EXPECTED="a - same as repo\nb - same as repo\nc - same as repo\nd - same as repo"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
