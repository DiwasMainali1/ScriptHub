#script-init and script-add test
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
Initialized empty script repository in .script
EOF

script-init > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

# 2) Edge-case for adding files. No input in command line
cat > "$expectedOut" <<EOF
usage: script-add <filenames>
EOF

script-add > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

# 3) Adding a file successfully.
echo "line 1" > a
cat > "$expectedOut" <<EOF
EOF

script-add a > "$actualOut" 2>&1

if ! diff "$expectedOut" "$actualOut"; then
    echo "Failed test"
    exit 1
fi

echo "Passed test"
exit 0