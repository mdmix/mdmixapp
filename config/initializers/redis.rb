if Rails.env.production?
  $redis = Redis.new(host: ENV["REDIS_URL"])
else
  $redis = Redis.new(host: 'localhost', port: 6379)
end

# $redis = Redis::Namespace.new("my_app", :redis => Redis.new)
