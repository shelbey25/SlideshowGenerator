#!/bin/bash
# Slideshow Generator - Local Server Launcher
# This starts a simple HTTP server and opens the app in your browser.

PORT=8080
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "============================================"
echo "  Slideshow Generator"
echo "============================================"
echo ""
echo "Starting server on http://localhost:$PORT"
echo "Press Ctrl+C to stop."
echo ""

cd "$DIR"

# Open browser after a short delay
(sleep 1 && open "http://localhost:$PORT" 2>/dev/null || xdg-open "http://localhost:$PORT" 2>/dev/null) &

# Start HTTP server
if command -v python3 &>/dev/null; then
    python3 -m http.server $PORT
elif command -v python &>/dev/null; then
    python -m SimpleHTTPServer $PORT
elif command -v npx &>/dev/null; then
    npx serve -l $PORT
else
    echo "Error: No suitable HTTP server found."
    echo "Install Python 3 or Node.js, then try again."
    exit 1
fi
