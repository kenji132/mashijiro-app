class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts ,:vegetable, :integer
    add_column :posts ,:garlic, :integer
    add_column :posts , :noodle,  :integer
    add_column :posts , :pig,  :integer
    add_column :posts , :backfat, :integer
    add_column :posts ,:point,  :float
  end
end
