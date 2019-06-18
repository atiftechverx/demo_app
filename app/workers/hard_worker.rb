class HardWorker
  include Sidekiq::Worker
  # sidekiq_options retry: true
  sidekiq_options queue: 'demo_default_queue'
  
  def perform(*args)
    # do something
    puts "Worker Started..."
    url = "http://175.10.20.129:8080/v1/ledgers"
    response = HTTParty.post(url, body: {})
    puts "#{response.body.inspect}"
  end
end