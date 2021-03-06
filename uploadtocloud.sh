#!/bin/bash

youtube-dl -o '%(title)s.%(ext)s' --extract-audio --audio-format mp3 $1
file=`youtube-dl --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" --get-filename  $1 --metadata-from-title "%(artist)s - %(title)s" --audio-quality 9`
filepath=$(echo "$file" | sed 's/ /\\ /g')
filepath=$(echo "$filepath" | sed 's/)/\\)/g')
filepath=$(echo "$filepath" | sed 's/(/\\(/g')
filepath=$(echo "$filepath" | sed 's/\]/\\\]/g')
filepath=$(echo "$filepath" | sed 's/\[/\\\[/g')
filepath=$(echo "$filepath" | sed 's/\&/\\&/g')
filepath=$(echo "$filepath" | sed 's/|/\\|/g')
filepath=$(echo "$filepath" | sed "s/'/\\\'/g")
filepath=$(echo "$filepath" | sed 's/\.\([^.]*\)$/\.mp3/')
echo $filepath
eval "curl -g -u user:password -T $filepath https://nextcloud.example.com/remote.php/dav/files/$user/path/where/you/want/to/save"
eval "rm $PWD/$filepath"
