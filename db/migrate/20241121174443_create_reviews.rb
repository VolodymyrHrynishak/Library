class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    def change
      create_table :reviews do |t|
        t.references :user, null: false, foreign_key: true
        t.references :book, null: false, foreign_key: true
        t.text :content
  
        t.timestamps
    end
  end
end
