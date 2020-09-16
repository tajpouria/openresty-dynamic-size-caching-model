return function()
	local upstream = 'dl2.perserver.site';

	if tonumber(ngx.var.slice_cache) < 1 then
		ngx.header['X-Handled-By-LUA'] = '1'
		ngx.var.upstream = upstream		
		return
	end

	ngx.header['X-Handled-By-Slice-Cache'] = '1'
	ngx.var.upstream = upstream		
end

