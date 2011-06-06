require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require "rspec/core/rake_task"
require 'rake/rdoctask'

task :default => :spec

desc 'Generate documentation'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Assets.io Rails 3.1 Helper'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/assetsio-rails.rb')
  rdoc.rdoc_files.include('lib/assetsio-rails/**/*.rb')
end
