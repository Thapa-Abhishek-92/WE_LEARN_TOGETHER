# test/application_system_test_case.rb
require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # JS不要の通常画面テストは rack_test を使う（Chrome不要で高速＆安定）
  driven_by :rack_test

  # 将来、JSが必要なテストを書きたいときは個別テストで下記のように切り替え可:
  #
  # test "something with JS", js: true do
  # end
end
