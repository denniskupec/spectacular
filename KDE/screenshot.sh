#!/bin/bash

filename="$HOME/Pictures/Screenshots/$(date +%s).png"

spectacle -rbw -o $filename > /dev/null 2>&1

if [ $? -eq 0 ];then
	url=`curl -s --header "Authorization: Client-ID 087060a2a8fc5ac" --form "image=@$filename" --form type='file' --url 'https://api.imgur.com/3/upload'  | python -c 'import json,sys;j=json.load(sys.stdin);print j["data"]["link"]'`
	xdg-open $url
fi

