class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :protect_destroy_in_production, only: :destroy  # ← 追加

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿が作成されました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました。"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿が削除されました。"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :situation, :content)
  end

  # ▼ 本番では削除を一時的に無効化（MVP措置）
  def protect_destroy_in_production
    return unless Rails.env.production?
    redirect_to @post, alert: "MVP段階の本番環境では削除を無効化しています。ログイン実装後に本人のみ削除可にします。"
  end
end
