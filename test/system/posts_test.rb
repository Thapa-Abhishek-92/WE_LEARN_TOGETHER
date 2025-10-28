# test/system/posts_test.rb
require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url

    # data-testid があればそれを優先、無ければ h1/h2 を見る
    if page.has_css?("[data-testid='posts-index-title']", visible: true)
      assert_selector "[data-testid='posts-index-title']", text: /Posts|投稿一覧/i
    else
      assert_selector "h1, h2", text: /Posts|投稿一覧/i
    end
  end

  test "should show post" do
    visit posts_url

    if page.has_link?(@post.title)
      click_on @post.title
    elsif page.has_link?("Show this post")
      click_on "Show this post", match: :first
    else
      first(:css, 'a[href^="/posts/"]').click
    end

    assert_text @post.title
    assert_text @post.content
  end
end
