# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  # 認証が必要なアクション（index/show 以外）
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
  end

  def new
    # ユーザーに紐づく新規インスタンス
    @post = current_user.posts.build
  end

  def create
    # 必ず current_user に紐づけて作成
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: "投稿を作成しました。"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: "投稿を削除しました。"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    # ユーザー関連は受け取らない（:user_id は許可しない）
    params.require(:post).permit(:title, :situation, :content)
  end
end
