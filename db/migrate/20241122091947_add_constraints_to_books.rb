class AddConstraintsToBooks < ActiveRecord::Migration[8.0]
  def change
    change_column_null :books, :title, false
    change_column_null :books, :author, false
    change_column_null :books, :genre, false
  end
end
