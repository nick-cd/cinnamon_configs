#!/bin/sh

# In case dmenu does not function, read the following comment thread:
# https://bbs.archlinux.org/viewtopic.php?id=217913
tr '\t' ' ' < ~/.local/bin/gui/emoticons | dmenu -i | cut -f1 -d' ' | tr -d '\n' | xclip -selection clipboard
