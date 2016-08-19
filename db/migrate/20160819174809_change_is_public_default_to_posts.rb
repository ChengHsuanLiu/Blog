class ChangeIsPublicDefaultToPosts < ActiveRecord::Migration[5.0]
  def change
    change_column_default(:posts, :is_public, true)
  end
end
