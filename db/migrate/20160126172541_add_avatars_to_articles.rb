class AddAvatarsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :avatars, :string
  end
end
