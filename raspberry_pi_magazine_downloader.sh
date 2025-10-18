#!/bin/bash
declare START_ISSUE=158
declare FINAL_ISSUE=1
declare URL_ROOT='https://magazine.raspberrypi.com'
declare MATCH_PATTERN='<a class="link" href="'

for issue in $(seq $START_ISSUE -1 $FINAL_ISSUE)
do
	download_page=$(wget -qO- "$URL_ROOT/issues/$issue/pdf/download")
	url_suffix=$(echo "$download_page" | grep -F "$MATCH_PATTERN" | cut -d'"' -f4)
	pdf_url="$URL_ROOT$url_suffix"
	wget -q -N --show-progress "$pdf_url"
done
