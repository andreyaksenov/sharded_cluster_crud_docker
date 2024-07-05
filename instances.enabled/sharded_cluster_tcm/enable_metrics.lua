local httpd

local function apply(cfg)
    if httpd then
        httpd:stop()
    end
    httpd = require('http.server').new('0.0.0.0', 8081)
    httpd:route({
        method = 'GET',
        name = '/metrics',
        path = '/metrics'
    }, function(req)
        local http_handler = require('metrics.plugins.prometheus').collect_http
        return http_handler()
    end)
    httpd:start()
end

local function stop()
    httpd:stop()
end

return {
    validate = function()
    end,
    apply = apply,
    stop = stop,
}
