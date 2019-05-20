#!/bin/bash

echo "my-secret : $MY_SECRET"
sed -i s/MY_SECRET/${MY_SECRET}/g /usr/share/nginx/html/index.html

nginx -g 'daemon off;'