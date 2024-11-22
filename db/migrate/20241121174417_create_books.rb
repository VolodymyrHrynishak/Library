class CreateBooks < ActiveRecord::Migration[8.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :author, null: false
      t.integer :publication_year
      t.string :genre, null: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end

    add_index :books, :title, unique: true 
  end
end
