require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.api_only = true
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.available_locales = %i[ja en]
    config.i18n.default_locale = :ja
    # config.eager_load_paths << Rails.root.join("extras")

    # 複数のロケールファイルが読み込まれるようpathを通す
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.session_store :cookie_store, key: '_interslice_session'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, {:key=>"_app_session"}
    config.middleware.use config.session_store, config.session_options
    config.middleware.use ActionDispatch::Flash
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:8000'
        resource '*',
                :headers => :any,
                # この一文で、渡される、'access-token'、'uid'、'client'というheaders情報を用いてログイン状態を維持する。
                :expose => ['access-token', 'expiry', 'token-type', 'uid', 'client'],
                :methods => [:get, :post, :options, :delete, :put]
      end
    end

    # ログからavatarパラメータを除外
    config.filter_parameters += [:avatar]

    config.middleware.use Rack::MethodOverride
  end
end
