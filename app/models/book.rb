class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :category, optional: true
  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :publication_year, 
  numericality: { only_integer: true, 
                  greater_than_or_equal_to: 1450, # перші друковані книги
                  less_than_or_equal_to: Date.today.year }, 
  allow_nil: true
  validates :genre, presence: true
end
