class CreatePostTagShips < ActiveRecord::Migration[5.0]
  def change
    create_table :post_tag_ships do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end

    add_index :post_tag_ships, :post_id
    add_index :post_tag_ships, :tag_id
  end
end
