#!/bin/bash

# Commit and push to main
# Usage: ./commit-push.sh "Your commit message"

set -e

# Check if commit message was provided
if [ -z "$1" ]; then
    echo "Usage: ./commit-push.sh \"Your commit message\""
    exit 1
fi

COMMIT_MSG="$1"

# Stage all changes
git add .

# Show what will be committed
echo "Changes to be committed:"
git status --short
echo ""

# Commit with the provided message
git commit -m "$COMMIT_MSG"

# Push to main
git push origin main

echo ""
echo "Successfully committed and pushed to main!"
