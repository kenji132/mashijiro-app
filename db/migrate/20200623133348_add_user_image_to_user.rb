class AddUserImageToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:user_image ,:binary
    add_column :users,:user_image_id ,:string
  end
end
