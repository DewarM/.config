#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Chrome - Work
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Open Chrome Work Profile
# @raycast.author Mungo Dewar

# Profile name (as found in Chrome's "Profile Path" or directory name)
PROFILE_NAME="Profile 4"

# Full path to Google Chrome, adjust if needed
CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

# Launch Chrome with the specified profile and open about:blank in a new window
"$CHROME_PATH" --profile-directory="$PROFILE_NAME" --new-window "about:blank"
# Close raycast
echo "raycast://close"
