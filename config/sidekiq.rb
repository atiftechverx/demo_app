require 'sidekiq'
require 'sidekiq/web'
redis_sidekiq_url = ENV.fetch("REDIS_SIDEKIQ_URL") { "redis://localhost:6379" }

Sidekiq::Web.use(Rack::Auth::Basic) do |user, password|
  [user, password] == [ 'admin', '123' ]

end

Sidekiq.configure_server do |config|
  config.redis = { url: redis_sidekiq_url }

  schedule_file = "config/schedule.yml"
end

Sidekiq.configure_client do |config|
  config.redis = { url: redis_sidekiq_url }
end
