require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module WeLearnTogether
  class Application < Rails::Application
    config.load_defaults 7.2
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :utc

    # 既定ロケールを日本語に
    config.i18n.default_locale = :ja
    # locales 下のサブディレクトリも全部読み込む
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
  end
end
