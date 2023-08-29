#!/bin/dash

# Initialize the repository
OUTPUT=$(./pigs-init 2>&1)
EXPECTED="Initialized empty pigs repository in .pig"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Create a file and add it to the repository
echo hello > a
./pigs-add a

# Commit the file
OUTPUT=$(./pigs-commit -m 'first commit' 2>&1)
EXPECTED="Committed as commit 0"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Delete the file and remove it from the repository
rm a
OUTPUT=$(./pigs-rm a 2>&1)
EXPECTED="pigs-rm: error: 'a' in the repository is different to the working file"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Commit the deletion
OUTPUT=$(./pigs-commit -m 'deleted a' 2>&1)
EXPECTED="nothing to commit"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

# Check the status of the files in the repository
OUTPUT=$(./pigs-status 2>&1)
EXPECTED="a - file deleted"
if [ "$OUTPUT" != "$EXPECTED" ]; then
    echo "Test fail: Expected '$EXPECTED', but got '$OUTPUT'"
    exit 1
fi

echo "Test successful"
exit 0
