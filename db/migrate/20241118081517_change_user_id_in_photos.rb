class ChangeUserIdInPhotos < ActiveRecord::Migration[7.1]
  def change
    change_column_null :photos, :user_id, true
  end
end
