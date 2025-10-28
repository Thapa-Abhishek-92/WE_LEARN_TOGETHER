# test/system/posts_test.rb
require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "visiting the index" do
    visit posts_url
    assert_selector "h1", text: "Posts"
  end

  test "should show post" do
    visit posts_url

    if page.has_link?(@post.title)
      click_on @post.title
    elsif page.has_link?("Show this post")
      click_on "Show this post", match: :first
    else
      # 最後の保険: /posts/:id へ飛ぶ最初のリンクを踏む
      first(:css, 'a[href^="/posts/"]').click
    end

    assert_text @post.title
    assert_text @post.content
  end
end
