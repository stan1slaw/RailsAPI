class Rack::Attack 
    safelist('allow from localhost') do |req|
        '127.0.0.1' == req.ip || '::1' == req.ip 
    end

    throttle('req/ip', :limit => 5, :period => 1.second) do |req|
        req.ip 
    end
end