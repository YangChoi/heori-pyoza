require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class OurWorker 
include Sidekiq::Worker

def perform(complexity)
  case complexity
    when "super_hard"
        sleep 20
        puts "whatever"
    when "hard"
        sleep 10
        puts "whatever222"
    else 
        sleep 1
        puts "whatever333"
    end
  end
end
