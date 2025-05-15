#!/bin/bash

# This script shows the size of each item in the current directory and sorts them in descending order

echo "Analyzing disk space in $(pwd)..."
echo ""

# This then shows list items and show their sizes in human-readable format, then sort
du -h --max-depth=1 2>/dev/null | sort -hr

echo ""
echo "Done."
