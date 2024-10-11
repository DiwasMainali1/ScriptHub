#pushy-init, pushy-add, pushy-commit and pushy-log test
PATH="$PATH:$(pwd)"

# Temp directory created for testing.
testDir="$(mktemp -d)"
cd "$testDir" || exit 1

# Create some files to hold output.
expectedOut="$(mktemp)"
actualOut="$(mktemp)"

# Remove the temporary directory when the test is done.
trap 'rm "$expected_output" "$actual_output" -rf "$test_dir"' INT HUP QUIT TERM EXIT


# 1) Creating repo successfully.
cat > "$expectedOut" <<EOF
Initialized empty pushy repository in .pushy
EOF

pushy-init > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

# 2) Adding many files successfully.
echo "line 1" > a
echo "line aa" > b
cat > "$expectedOut" <<EOF
EOF

pushy-add a b > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

# 3) Edge check on commiting. No input provided
echo "line 1" > a
echo "line aa" > b
cat > "$expectedOut" <<EOF
usage: pushy-commit [-a] -m commit-message
EOF

pushy-commit > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

# 4) Successful commit
echo "line 1" > a
echo "line aa" > b
cat > "$expectedOut" <<EOF
Committed as commit 0
EOF
pushy-add a b > "$actualOut" 2>&1
pushy-commit -m "First One" > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

# 5) Commit Logs check
cat > "$expectedOut" <<EOF
0 First One
EOF

pushy-log > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi


echo "Passed test"
exit 0