# db/migrate/20251028065310_add_user_to_posts.rb
class AddUserToPosts < ActiveRecord::Migration[7.2]
  def up
    # 1) まずは NULL 許容で追加
    add_reference :posts, :user, null: true, foreign_key: true

    # 2) 既存Postを埋めるためのユーザー（Devise必須だけ）
    user = User.first || User.create!(
      email: "seed@example.com",
      password: "password"
    )

    # 3) 既存Postの user_id を一括で埋める
    Post.where(user_id: nil).update_all(user_id: user.id)

    # 4) NOT NULL制約に変更
    change_column_null :posts, :user_id, false

    add_index :posts, :user_id unless index_exists?(:posts, :user_id)
  end

  def down
    remove_reference :posts, :user, foreign_key: true
  end
end
