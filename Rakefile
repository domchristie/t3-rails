begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

require 'rdoc/task'

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'T3Rails'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

desc "Update T3 versions"
task :update_t3 do
  def download_t3(version)
    %w(t3 t3.min t3-testing).each do |file_name|
      puts "Downloading #{file_name}.js"
      puts `curl -o vendor/assets/javascripts/#{file_name}.js http://cdn.rawgit.com/box/t3js/v#{version}/dist/#{file_name}.js`
    end
  end

  download_t3(T3::Rails::T3_VERSION)
  puts "\e[32mDone!\e[0m"
end

task default: :test
