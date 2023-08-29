#!/bin/dash

# Initialize the repository
OUTPUT=$(./pigs-init 2>&1)
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
OUTPUT=$(./pigs-commit -m 'first commit' 2>&1)
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Modify files 'a' and 'b', and add 'b' to the repository
echo change > a
echo change > b
./pigs-add b

# Create a new file 'c' and try to add 'c' and 'd' to the repository
echo change > c
OUTPUT=$(./pigs-add c d 2>&1)
EXPECTED="pigs-add: error: can not open 'd'"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Commit the changes
OUTPUT=$(./pigs-commit -m 'committed changes to b and d' 2>&1)
EXPECTED="Committed as commit 1"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Check the status of the files in the repository
OUTPUT=$(./pigs-status 2>&1)
EXPECTED="a - file changed, changes not staged for commit\nb - same as repo\nc - same as repo"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
