# config/application.rb
require_relative "boot"
require "rails/all"

Bundler.require(*Rails.groups)

module WeLearnTogether
  class Application < Rails::Application
    # Rails 7 系の既定設定を読み込む（8.0は不可）
    config.load_defaults 7.2

    # 表示は日本時間、DB保存はUTCのまま
    config.time_zone = "Tokyo"
    config.active_record.default_timezone = :utc

    # 既定ロケールを日本語に
    config.i18n.default_locale = :ja
    # （任意）読み込みロケールの拡張：locales配下のymlを全部読む
    config.i18n.load_path += Dir[Rails.root.join("config", "locales", "**", "*.{rb,yml}")]
  end
end
