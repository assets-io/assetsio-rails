begin
  module Sprockets
    module Helpers
      module RailsHelper

        def javascript_include_tag_with_assetsio(*sources)
          if Rails.env.production?
            options = sources.extract_options!
            asset_sources = sources.map { |source| asset_path(source, 'js') }
            javascript_include_tag_without_assetsio(AssetsIO.asset_url(asset_paths.controller.request, 'js', *asset_sources), options)
          else
            javascript_include_tag_without_assetsio(*sources)
          end
        end
        alias_method_chain :javascript_include_tag, :assetsio

        def stylesheet_link_tag_with_assetsio(*sources)
          if Rails.env.production?
            options = sources.extract_options!
            asset_sources = sources.map { |source| asset_path(source, 'css') }
            stylesheet_link_tag_without_assetsio(AssetsIO.asset_url(asset_paths.controller.request, 'css', *asset_sources), options)
          else
            stylesheet_link_tag_without_assetsio(*sources)
          end
        end
        alias_method_chain :stylesheet_link_tag, :assetsio

      end
    end
  end

rescue NameError => e
  raise "assetsio-rails initialization failed: #{e}"
end
