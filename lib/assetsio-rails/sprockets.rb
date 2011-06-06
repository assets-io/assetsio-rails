begin
  if ActionView::Helpers.const_defined?(:SprocketsHelper)

    module ::ActionView::Helpers::SprocketsHelper

      def sprockets_javascript_include_tag_with_assetsio(source, options = {})
        if Rails.env.production?
          sprockets_javascript_include_tag_without_assetsio(AssetsIO.asset_url(sprockets_asset_paths.controller.request, asset_path(source, 'js'), 'js'), options)
        else
          sprockets_javascript_include_tag_without_assetsio(source, options)
        end
      end
      alias_method_chain :sprockets_javascript_include_tag, :assetsio

      def sprockets_stylesheet_link_tag_with_assetsio(source, options = {})
        if Rails.env.production?
          sprockets_stylesheet_link_tag_without_assetsio(AssetsIO.asset_url(sprockets_asset_paths.controller.request, asset_path(source, 'css'), 'css'), options)
        else
          sprockets_stylesheet_link_tag_without_assetsio(source, options)
        end
      end
      alias_method_chain :sprockets_stylesheet_link_tag, :assetsio

    end

  else
    raise NameError
  end

rescue NameError
  raise "assetsio-rails initialization failed: ActionView::Helpers::SprocketsHelper is not defined!"
end
