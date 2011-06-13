require 'assetsio'

module AssetsIO
  module Rails

    class Railtie < ::Rails::Railtie
      config.to_prepare do
        require 'assetsio/rails/sprockets'
      end
    end

  end
end
