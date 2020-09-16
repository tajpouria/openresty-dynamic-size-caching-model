# openresty-dynamic-caching-model

An NGINX/Openresty configuration model that alter between default and slice caching method based on upstream content length.

**This repository not considered as a production ready model**

Alpha tested using:

```
nginx version: openresty/1.15.8.3
built by gcc 7.5.0 (Ubuntu 7.5.0-3ubuntu1~18.04)
built with OpenSSL 1.1.1  11 Sep 2018
TLS SNI support enabled
configure arguments: --prefix=/usr/local/openresty/nginx --with-cc-opt=-O2 --add-module=../ngx_devel_kit-0.3.1rc1 --add-module=../echo-nginx-module-0.61 --add-module=../xss-nginx-module-0.06 --add-module=../ngx_coolkit-0.2 --add-module=../set-misc-nginx-module-0.32 --add-module=../form-input-nginx-module-0.12 --add-module=../encrypted-session-nginx-module-0.08 --add-module=../srcache-nginx-module-0.31 --add-module=../ngx_lua-0.10.15 --add-module=../ngx_lua_upstream-0.07 --add-module=../headers-more-nginx-module-0.33 --add-module=../array-var-nginx-module-0.05 --add-module=../memc-nginx-module-0.19 --add-module=../redis2-nginx-module-0.15 --add-module=../redis-nginx-module-0.3.7 --add-module=../rds-json-nginx-module-0.15 --add-module=../rds-csv-nginx-module-0.09 --add-module=../ngx_stream_lua-0.0.7 --with-ld-opt=-Wl,-rpath,/usr/local/openresty/luajit/lib --with-http_v2_module --with-http_slice_module --with-stream --with-stream_ssl_module --with-stream_ssl_preread_module --with-http_ssl_module

```

## Prerequisite

- [ledgetech/lua-resty-http](https://github.com/ledgetech/lua-resty-http)

## Example

Consider `x-cache`, `x-handled-by-lua`, and, `x-handled-by-slice-cache` in following examples which:

- x-cache: Determine whether content served from cache or not.

- x-handled-by-lua: Equals to 1 if content caching not handled by slice cache.

- x-handled-by-slice-cache: Equals to 1 if content caching handled by slice cache.

> curl -I https://127.0.0.1:443;

```sh
HTTP/2 200
server: openresty/1.15.8.3
date: Wed, 16 Sep 2020 12:32:01 GMT
content-type: text/html
x-handled-by-lua: 1
vary: Accept-Encoding
x-cache: MISS

```

> curl -I https://127.0.0.1:443/Apporiginal/CDisplayExWin32v1.10.33.PerDL.ir.exe;

```sh
HTTP/2 200
server: openresty/1.15.8.3
date: Wed, 16 Sep 2020 12:37:44 GMT
content-type: application/octet-stream
content-length: 7269345
x-handled-by-slice-cache: 1
last-modified: Sat, 09 Nov 2019 10:26:08 GMT
etag: "5dc69440-6eebe1"
x-cache: HIT
accept-ranges: bytes

```

## License

[MIT License](LICENSE)
