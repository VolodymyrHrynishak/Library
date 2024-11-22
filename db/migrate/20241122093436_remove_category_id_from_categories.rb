class RemoveCategoryIdFromCategories < ActiveRecord::Migration[8.0]
  def change
    remove_column :categories, :category_id, :integer
  end
end
