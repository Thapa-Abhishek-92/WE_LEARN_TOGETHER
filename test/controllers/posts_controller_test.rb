# test/controllers/posts_controller_test.rb
require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)   # ← テスト用ユーザーをfixturesから読み込み
    @post = posts(:one)   # ← posts.yml の one を使用
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    sign_in @user               # ← ログインが必要なページなので追加
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    sign_in @user               # ← ログインユーザーとして投稿
    assert_difference("Post.count") do
      post posts_url, params: {
        post: {
          title: "テスト作成",
          situation: "駅で",
          content: "メモ内容"
        }
      }
    end
    assert_redirected_to post_url(Post.last)
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    sign_in @user
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    sign_in @user
    patch post_url(@post), params: {
      post: {
        title: "更新後タイトル",
        situation: @post.situation,
        content: @post.content
      }
    }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    sign_in @user
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end
    assert_redirected_to posts_url
  end
end
