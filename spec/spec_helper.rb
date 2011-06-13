require 'rails'
require 'active_support/core_ext/object/to_json'
require 'action_view/helpers/capture_helper'
require 'sprockets/helpers/rails_helper'
require 'assetsio'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |c|
  # room for custom config options
end
