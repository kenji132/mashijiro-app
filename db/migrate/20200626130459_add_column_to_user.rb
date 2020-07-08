class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :total, :float
    add_column :users, :average, :float

  end
end
