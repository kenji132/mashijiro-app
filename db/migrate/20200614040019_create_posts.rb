class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :store_name
      t.text :review
      t.string :picture_name
      t.binary :picture
      t.string :picture_id


      t.timestamps
    end
  end
end
