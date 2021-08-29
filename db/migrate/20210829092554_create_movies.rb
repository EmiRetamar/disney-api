class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string  :title
      t.string  :creation_date
      t.string  :rating
      t.string  :image
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
