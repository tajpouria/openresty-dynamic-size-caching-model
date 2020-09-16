function isLargeContent(contentLen)
    if tonumber(contentLen) >= 2e+6 then
       return true
    else
       return false
    end
end

return function()
	local upstream = 'dl2.perserver.site';

	local http = require 'resty.http'
	local httpc = http.new()
	
	local rURI = ''
	if ngx.var.request_uri then
		rURI = ngx.var.request_uri
	end

	local res, err = httpc:request_uri('http://' .. upstream .. rURI , {method = 'HEAD'})
	
	if res then
		local upcl = res.headers['Content-Length']
		if upcl then
			if isLargeContent(upcl) then
				ngx.var.slice_cache = 1
				ngx.header['X-Handled-By-Slice-Cache'] = '1'
				ngx.var.upstream = upstream		
				return
			end		
		end 
	else
		ngx.log(ngx.ERR, 'failed to request: ' .. err)
	end

	ngx.header['X-Handled-By-LUA'] = '1'
	ngx.var.upstream = upstream		
end

