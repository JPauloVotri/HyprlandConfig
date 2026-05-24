#!/bin/bash

song_info=$(playerctl metadata --format '{{artist}}    {{title}}' 2>/dev/null)

escaped=$(echo "$song_info" | sed \
    -e 's/&/\&amp;/g' \
    -e 's/</\&lt;/g' \
    -e 's/>/\&gt;/g' \
    -e "s/'/\&apos;/g" \
    -e 's/"/\&quot;/g')

echo "$escaped"