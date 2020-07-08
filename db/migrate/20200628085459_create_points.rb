class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.float :value
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
