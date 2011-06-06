# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'assetsio-rails/version'

Gem::Specification.new do |s|
  s.name        = 'assetsio-rails'
  s.summary     = 'Assets.io helper for Rails 3.1'
  s.email       = 'martin.rehfeld@assets.io'
  s.homepage    = 'https://github.com/assets-io/assetsio-rails'
  s.description = 'Use Assets.io to deliver your Javascript and CSS assets from the Amazon Cloudfront CDN.'
  s.authors     = ['Martin Rehfeld']
  s.version     = AssetsIO::VERSION
  s.platform    = Gem::Platform::RUBY

  s.add_dependency 'addressable'

  s.add_development_dependency 'rspec', '>=2.0'
  s.add_development_dependency 'rake'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
