class CreateCharacters < ActiveRecord::Migration[6.1]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :age
      t.string :weight
      t.string :history
      t.string :image

      t.timestamps
    end
  end
end
