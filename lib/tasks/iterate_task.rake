namespace :iterate_task do
 
  desc "Task for Iterate"
  
  task start: :environment do
    i = 1
    10000.times.each do
      puts "Index: #{i}"
      job_id = HardWorker.perform_async(i)
      puts "JOB ID: #{job_id}"
      # sleep 1 # in seconds
      i = i+1
    end

  end
end