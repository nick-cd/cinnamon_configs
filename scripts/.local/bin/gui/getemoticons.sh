#!/bin/sh

tr '\t' ' ' < ~/.local/bin/gui/emoticons | dmenu | cut -f1 -d' ' | tr -d '\n' | xclip -selection clipboard
