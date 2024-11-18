class AddArticleToPhotos < ActiveRecord::Migration[7.1]
  def change
    add_reference :photos, :article, null: false, foreign_key: true
  end
end
