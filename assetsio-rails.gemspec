# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require 'assetsio/rails/version'

Gem::Specification.new do |s|
  s.name        = 'assetsio-rails'
  s.summary     = 'Assets.io helper for Rails 3.1'
  s.email       = 'martin.rehfeld@assets.io'
  s.homepage    = 'https://github.com/assets-io/assetsio-rails'
  s.description = 'Use Assets.io to deliver your Javascript and CSS assets from the Amazon Cloudfront CDN.'
  s.authors     = ['Martin Rehfeld']
  s.version     = AssetsIO::Rails::VERSION
  s.platform    = Gem::Platform::RUBY

  s.rubygems_version = '1.3.7'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables      = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_path     = 'lib'
  s.extra_rdoc_files = ['README.md']
  s.rdoc_options     = ['--charset=UTF-8']

  s.add_dependency             'assetsio', '0.0.2'
  s.add_dependency             'railties', '>=3.1.0.rc4'

  s.add_development_dependency 'rdoc',  '>=2.4.2'
  s.add_development_dependency 'rspec', '>=2.0'
  s.add_development_dependency 'rake'
end
