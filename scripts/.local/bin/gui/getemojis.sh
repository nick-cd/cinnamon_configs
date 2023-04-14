#!/bin/sh
# Emoji list from freecodecamp:
# https://www.freecodecamp.org/news/all-emojis-emoji-list-for-copy-and-paste/#smileyfaceemojis

# In case dmenu does not function, read the following comment thread:
# https://askubuntu.com/questions/1236488/x-error-of-failed-request-badlength-poly-request-too-large-or-internal-xlib-le
tr '\t' ' ' < ~/.local/bin/gui/emojis | dmenu -i | cut -f1 -d' ' | tr -d '\n' | xclip -selection clipboard
