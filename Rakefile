Bundler.require(:development, :test)

Cucumber::Rake::Task.new :features do |t|
  t.cucumber_opts = %w{--format pretty}
end

RSpec::Core::RakeTask.new(:spec)

[:test, :development, :production].each do |environment|
  namespace environment do
    task :start, :port do |task, args|
      ENV['port'] = args[:port] || "#{rand(9999)}"
      ChildProcess.build(*"rackup -E #{environment} -p #{ENV['port']}".split).start
      puts "Started in #{environment}! Visit http://localhost:#{ENV['port']}/temperatures"
    end
  end
end

task :stop, :port do |task, args|
  `fuser -k #{ENV['port'] || args[:port]}/tcp`
  puts 'Stopped!'
end

task :default => [:spec, :'test:start', :features, :stop]