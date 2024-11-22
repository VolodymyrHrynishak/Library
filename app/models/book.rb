class Book < ApplicationRecord
  has_many :reviews
  belongs_to :category
  validates :title, presence: true
  validates :author, presence: true
  validates :publication_year, 
  numericality: { only_integer: true, 
                  greater_than_or_equal_to: 1450, # перші друковані книги
                  less_than_or_equal_to: Date.today.year }, 
  allow_nil: true
  validates :genre, presence: true
  validates :title, uniqueness: true
end
