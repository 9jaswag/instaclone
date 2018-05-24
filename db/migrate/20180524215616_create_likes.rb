class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :like_count, default: 0
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
