class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :caption
      t.references :user, foreign_key: true
      t.attachment :image

      t.timestamps
    end
  end
end
