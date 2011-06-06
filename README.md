# Assets.io Rails 3.1 Helper

Use Assets.io to deliver your Javascript and CSS assets from the
Amazon Cloudfront CDN.

## Installation

Add `asssetsio-rails` to your Gemfile:

    gem 'assetsio-rails'

Create an initializer, i.e. `config/initializers/assetsio.rb`:

    require 'assetsio-rails'
    AssetsIO.account = '<your-account-id>'

## Usage

`assetsio-rails` hooks into the Rails 3.1 asset pipeline and will automatically
deliver Javascript & CSS assets included with `javascript_include_tag` and
`stylesheet_link_tag` via Assets.io and Amazon's Cloudfront CDN when run in the
`production` environment.

## References

For more information about Assets.io visit <http://www.assets.io>

## License

The `assetsio-rails` Gem is released under the MIT license.
