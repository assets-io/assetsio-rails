module AssetsIO

  class Railtie < ::Rails::Railtie
    config.to_prepare do
      require 'assetsio-rails/sprockets'
    end
  end

end
