require 'rails/all'
require 'assetsio-rails'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |c|
  # room for custom config options
end
