#! /bin/bash
/usr/local/openresty/bin/openresty -p . -c "$(pwd)/conf/nginx.conf"

