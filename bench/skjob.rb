require 'sidekiq'

class SidekiqJob
  include Sidekiq::Job
  @@count = 0
  def perform(count, time)
    @@count += 1  
    if @@count == count  
      puts "finished in #{Time.now.to_f - time} seconds (#{count / (Time.now.to_f - time)} jps)"
      @@count = 0
    end
  end
end
