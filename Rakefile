require 'bundler'
Bundler.setup
Bundler::GemHelper.install_tasks

require 'rdoc/task'
require 'rspec'
require 'rspec/core/rake_task'

desc "Run all examples"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[--color]
end

task :default => :spec

desc 'Generate documentation'
RDoc::Task.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Assets.io Rails 3.1 Helper'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/assetsio-rails.rb')
  rdoc.rdoc_files.include('lib/assetsio-rails/**/*.rb')
end
